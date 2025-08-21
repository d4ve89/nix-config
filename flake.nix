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

    # sources to declare nix-doom-emacs:
    nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    nix-doom-emacs-unstraightened.inputs.nixpkgs.follows="";

    # sources to declare neovim config:
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # sources to theme programs and shells:
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    #nix-colors.url = "github:misterio77/nix-colors";
    #nix-colors.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    mac-app-util.inputs.nixpkgs.follows = "nixpkgs";

    # sources for individual programs:
    curd.url = "github:Wraient/curd";
    #idea-c-pin2024.url = "github:NixOS/nixpkgs/c5dd43934613ae0f8ff37c59f61c507c2e8f980d";

  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, systems, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // inputs.home-manager.lib;

      forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});

      pkgsFor = lib.genAttrs (import systems) (
        system:
          import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            config.allowUnfreePredicate = _: true;
            overlays = [
              (self: super: import ./packages { pkgs = super; })
            #inputs.idea-c-pin2024
             ];
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
      homeManagerModules = import ./modules/home;
      overlays = import ./overlays {inherit inputs outputs;};
      packages = forEachSystem (pkgs: import ./packages {inherit pkgs;});
        
      #packages = lib.genAttrs (import systems) (system: import ./packages { pkgs = pkgsFor.${system}; }); 

      #packages = forEachSystem (
      #  system:
      #  let
      #    pkgs = import nixpkgs {
      #      inherit system;
      #      overlays = [ self.overlays.default ];
      #    };
      #  in
      #  nixpkgs.lib.packagesFromDirectoryRecursive {
      #    callPackage = nixpkgs.lib.callPackageWith pkgs;
      #    directory = ./packages;
      #  }
      #);
      #packages = lib.genAttrs (import systems) (system: import ./packages {pkgs = pkgsFor.${system}; });

      #packages = lib.genAttrs (import systems) (system: import ./packages { pkgs = pkgsFor.${system}; });
      #devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
      #formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);
      #formatter = lib.genAttrs (import systems) (system: pkgsFor.${system}.nixfmt-rfc-style);

      # automatically select correct build from localhost name:
      nixosConfigurations = lib.listToAttrs (
        map ({ role, host, arch, ... }: {
          name = host;
          value = nixpkgs.lib.nixosSystem {
            system = arch;
            specialArgs = {
              inherit inputs outputs lib;
              isDarwin = false;
              role = role;
            };
            modules = [ 
              ./hosts/common/core/default.nix
              ./hosts/${role}/${host}/configuration.nix ];
          };
        }) nixosHosts
      );

      # sudo nix flake update
      # sudo darwin-rebuild switch --flake .
      # sudo nixos-rebuild switch --flake .
      darwinConfigurations = lib.listToAttrs (
        map ({ role, host, arch }: {
          name = host;
          value = nix-darwin.lib.darwinSystem {
            system = arch;
            specialArgs = {
              inherit inputs outputs lib;
              isDarwin = true;
              role = role;
            };
            modules = [ 
              ./hosts/common/core/default.nix
              ./hosts/${role}/${host}/configuration.nix
              # if you want to switch back to integrated home-manager as nixdarwin-module:
              #
              #inputs.home-manager.darwinModules.home-manager {
              #  users.users.david.name = "david";
              #  users.users.david.home = "/Users/david";
              #  home-manager = {
              #    useGlobalPkgs = true;
              #    useUserPackages = true;
              #    extraSpecialArgs = { inherit inputs; };
              #      users.david = {
              #      imports = [
              #        ./hosts/common/core/home.nix
              #        ./hosts/${role}/${host}/home.nix
              #        ./modules/home/theme/theme-specialisation.nix
              #      ];
              #      };
              #  };
              #}
              inputs.nix-homebrew.darwinModules.nix-homebrew {
                nix-homebrew = {
                  enable = true;
                  enableRosetta = false;
                  user = "david";
                  taps = {
                    "homebrew/homebrew-core" = inputs.homebrew-core;
                    "homebrew/homebrew-cask" = inputs.homebrew-cask;
                  };
                  mutableTaps = false;
                };
              }
            ];
          };
        }) darwinHosts
      );

      # standalone home manager configuration
      # home-manager switch --flake .
      homeConfigurations = lib.listToAttrs (
        map ({ role, host, arch }: {
          name = host;
          value = home-manager.lib.homeManagerConfiguration {
            pkgs = pkgsFor.${arch};
            extraSpecialArgs = {
              inherit inputs outputs role host arch;
              isDarwin = lib.hasSuffix "-darwin" arch;
            };
            modules = [
              ./hosts/common/core/home.nix
              ./hosts/${role}/${host}/home.nix
              ./modules/home/theme/theme-specialisation.nix
              # Add any other HM-specific modules here
            ];
          };
        }) hosts
      );
    };

}
