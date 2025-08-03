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
  };

  outputs = { self, nixpkgs, nix-darwin, systems, home-manager,... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      #lib = nixpkgs.lib.extend (self: super: { 
      #  custom = import ./lib { inherit (nixpkgs) lib; }; 
      #});
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

      # Get all hosts as a list of { role, host, system }
      allHosts = lib.flatten (
        map (role:
          let rolePath = ./hosts + "/${role}";
          in map (host: {
            role = role;
            host = host;
            system = (import (rolePath + "/${host}/system.nix") { 
                inherit lib; }).system or "x86_64-linux";
            }) (builtins.attrNames (builtins.readDir rolePath))
        ) (builtins.attrNames (builtins.readDir ./hosts))
      );

      # Partition hosts by their specified system
      nixosHosts = lib.filter (h: lib.hasSuffix "-linux" h.system) allHosts;
      darwinHosts = lib.filter (h: lib.hasSuffix "-darwin" h.system) allHosts;


    in {
      inherit lib;
      systemModules = import ./modules/system;
      userModules = import ./modules/user;

      overlays = import ./overlays {inherit inputs outputs;};

      packages = forEachSystem (pkgs: import ./packages {inherit pkgs;});
      devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});
      formatter = forEachSystem (pkgs: pkgs.nixfmt-rfc-style);

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
        map ({ role, host, ... }: {
          name = host;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs lib;
              isDarwin = false;
              role = role;
            };
            modules = [ "./hosts/${role}/${host}/configuration.nix" ];
          };
        }) nixosHosts
      );

      darwinConfigurations = lib.listToAttrs (
        map ({ role, host, ... }: {
          name = host;
          value = nix-darwin.lib.darwinSystem {
            specialArgs = {
              inherit inputs lib;
              isDarwin = true;
              role = role;
            };
            modules = [ "./hosts/${role}/${host}/configuration.nix" ];
          };
        }) darwinHosts
      );

      #standalone homemanager:
      #homeConfigurations = { };

    };

}
