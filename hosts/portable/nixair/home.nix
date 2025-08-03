{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ../../common/core/home.nix
  ];

  home.username = "david";
  home.homeDirectory = lib.mkForce "/Users/david";

  # host specific user packages:
  home.packages = [
	pkgs.hello
	pkgs.htop
  ];

  # dotfiles for this host:
  home.file = {
    "testfile2".target = "testfile_from_home.nix";
    "testfile2".text = ''home.nix works'';
  };

  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.


}
