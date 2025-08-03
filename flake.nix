{
  description = "Personal nixflake for multiple hosts and architectures";

  inputs = {
    # official package sources:
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-darwin.url = "github:nix-darwin/nix-darwin/master";
    nixpkgs-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixpkgs-wsl.inputs.nixpkgs.follows = "nixpkgs";
    hardware.url = "github:nixos/nixos-hardware";

    # default system names (aarch-darwin, x86_64-linux, etc.):
    systems.url = "github:nix-systems/default";

    # sources to declare user and home settings:
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
   
    # sources to declare homebrew casks and brews:
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    #nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-core.flake = false;
    homebrew-cask.flake = false;

    # sources to declare disk partitions:
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # sources to declare virtual machines:
    nixvirt.url = "https://flakehub.com/f/AshleyYakeley/NixVirt/*.tar.gz";
    nixvirt.inputs.nixpkgs.follows = "nixpkgs";

    # sources to declare secrets:
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # sources to declare neovim config:
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # sources to theme programs and shells:
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    #nix-colors.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    mac-app-util.inputs.nixpkgs.follows = "nixpkgs";

    # sources for individual programs:
    curd.url = "github:Wraient/curd";
    
  };

  outputs = { self, nixpkgs, nix-darwin, systems, home-manager,... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;

      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs (import systems) (
        system:
          import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          }
      );

      #forAllSystems = nixpkgs.lib.genAttrs [
      #  "aarch64-darwin"
      #  "aarch64-linux"
      #  "x86_64-linux"
      #];

      # Get all hosts as a list of { role, host, arch }
      hosts = lib.flatten (
        map (role:
          let rolePath = ./hosts + "/${role}";
          in map (host: {
            role = role;
            host = host;
            arch = import (rolePath + "/${host}/system.nix");
            }) (builtins.attrNames (builtins.readDir rolePath))
        ) (lib.filter (role: role != "common") (builtins.attrNames (builtins.readDir ./hosts)))
      );

      # Partition hosts by their specified system
      nixosHosts = lib.filter (h: lib.hasSuffix "-linux" h.arch) hosts;
      darwinHosts = lib.filter (h: lib.hasSuffix "-darwin" h.arch) hosts;


    in {
      inherit lib;
      nixosModules = import ./modules/system;
      homeManagerModules = import ./modules/user;
      overlays = import ./overlays {inherit inputs;};
      packages = forEachSystem (pkgs: import ./packages {inherit pkgs;});
      #packages = lib.genAttrs (import systems) (system: import ./packages { pkgs = pkgsFor.${system}; });
      #devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
      formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);
      #formatter = lib.genAttrs (import systems) (system: pkgsFor.${system}.nixfmt-rfc-style);

      # custom packages:
      #packages = forAllSystems (
      #  system: import ./packages nixpkgs.legacyPackages.${system}
      #);
      # modifications on official packages:
      #overlays = import ./overlays {inherit inputs;};
      # system modules:
      #systemModules = import ./modules/system;
      # home-manager modules:
      #userModules = import ./modules/user;
      # nix formatter:
      #formatter = forAllSystems (
      #  system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style
      #);


      # automatically select correct build from localhost name:
      nixosConfigurations = lib.listToAttrs (
        map ({ role, host, arch, ... }: {
          name = host;
          value = nixpkgs.lib.nixosSystem {
            system = arch;
            specialArgs = {
              inherit inputs lib;
              isDarwin = false;
              role = role;
            };
            modules = [ 
              ./hosts/common/core/default.nix
              ./hosts/${role}/${host}/configuration.nix ];
          };
        }) nixosHosts
      );

      darwinConfigurations = lib.listToAttrs (
        map ({ role, host, arch }: {
          name = host;
          value = nix-darwin.lib.darwinSystem {
            system = arch;
            specialArgs = {
              inherit inputs lib;
              isDarwin = true;
              role = role;
            };
            modules = [ 
              ./hosts/common/core/default.nix
              ./hosts/${role}/${host}/configuration.nix 
              home-manager.darwinModules.home-manager {
                users.users.david.name = "david";
                users.users.david.home = "/Users/david";
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = { inherit inputs; };
                  users.david = import ./hosts/${role}/${host}/home.nix;
                };
              }
              inputs.nix-homebrew.darwinModules.nix-homebrew {
                nix-homebrew = {
                  enable = true;
                  enableRosetta = false;
                  user = "david";
                  taps = {
                    "homebrew/homebrew-core" = inputs.homebrew-core;
                    "homebrew/homebrew-cask" = inputs.homebrew-cask;
                  };
                  mutableTaps = true;
                };
              }
            ];
          };
        }) darwinHosts
      );

      #standalone homemanager:
      #homeConfigurations = { };

    };
}
