{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    #../../common/core/home.nix
  ];

  home.username = "david";
  home.homeDirectory = lib.mkForce "/home/david";

  # host specific user packages:
  home.packages = [
	  pkgs.hello
	  pkgs.htop
    #pkgs.temurin-bin-21
    #pkgs.jdk21
    #pkgs.jetbrains.jdk
    pkgs.gradle 
    pkgs.nodejs
    pkgs.excalidraw_export
  ];

  wayland.windowManager.hyprland.settings = {
    decoration = {
      shadow_offset = "0 5";
    };
    "$mod" = "SUPER";

  };


  #programs.java = {
  #  enable = true;
  #  package = pkgs.temurin-bin-21;
    #package = pkgs.jetbrains.jdk-21;
  #};

  #programs.doom-emacs = {
    #emacs = pkgs.emacs-macport;
  #};

  home.sessionVariables = {
    #TERM = "xterm";
    #_JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd";
    #IDEA_JDK = lib.mkForce "${pkgs.temurin-bin-21}";
    #JAVA_HOME = lib.mkForce "${pkgs.temurin-bin-21}/Contents/Home"; not needed/wrong
    #GRADLE_HOME = "${pkgs.gradle}/lib/gradle";
  };

  # dotfiles for this host:
  home.file = {
    #"testfile2".target = "testfile_from_home.nix";
    #"testfile2".text = ''home.nix works'';
  };
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.


}
