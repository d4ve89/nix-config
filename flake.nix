{
  description = "Personal nixflake for multiple hosts and architectures";

  inputs = {
    # official package sources:
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.url = "github:nix-darwin/nix-darwin/master";
    nixpkgs-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixpkgs-wsl.inputs.nixpkgs.follows = "nixpkgs";
    hardware.url = "github:nixos-hardware";

    # sources to declare user and home settings:
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
   
    # sources to declare homebrew casks and brews:
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;

    # sources to declare disk partitions:
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # sources to declare virtual machines:
    nixvirt.url = "https://flakehub.com/f/AshleyYakely/NixVirt/*.tar.gz";
    nixvirt.inputs.nixpkgs.follows = "nixpkgs";

    # sources to declare secrets:
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # sources to declare neovim config:
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # sources to style programs and shells:
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    nix-colors.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    mac-app-util.inputs.nixpkgs.follows = "nixpkgs";

    # sources for individual programs:
  };

  outputs = { self, nixpkgs, nix-darwin, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
    in {
      # custom packages:
      packages = forAllSystems (
        system: import ./packages nixpkgs.legacyPackages.${system}
      );
      # modifications on official packages:
      overlays = import ./overlays {inherit inputs;};
      # system modules:
      systemModules = import ./modules/system;
      # home-manager modules:
      userModules = import ./modules/user;
      # nix formatter:
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      darwinConfigurations = { 

      }; 

      nixosConfigurations = { 

      };

      homeConfigurations = { 

      };

    };

}
