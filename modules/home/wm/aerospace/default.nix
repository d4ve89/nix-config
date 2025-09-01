{ config, pkgs, lib, ... }:
# let
#      pkgs = import (builtins.fetchGit {
#          # Descriptive name to make the store path easier to identify
#          name = "aerospace-17";
#          url = "https://github.com/NixOS/nixpkgs/";
#          ref = "refs/heads/nixpkgs-unstable";
#          rev = "c5dd43934613ae0f8ff37c59f61c507c2e8f980d";
#      }) {};

#      myPkg = pkgs.aerospace;
#      aerospace-17 = pkgs.aerospace;
# in
{

# Aerospace Tiling WM configuration
  config.home.file.".config/aerospace" = lib.mkIf config.wm_aerospace.enable {
    source =  ../../../../dotfiles/config/aerospace;
    force = true;
  };


  config.programs.aerospace = lib.mkIf config.wm_aerospace.enable {
    enable = true;
    package = pkgs.aerospace;
    #package = aerospace-17;

    #userSettings = ~.config/aerospace/aerospace.toml;
    #userSettings = {

    # # 0 disables padding feature
    # accordion-padding = 30;

    # #after-login-command = [ " " ];
    #  #after-startup-command = ["exec-and-forget borders"];

    #  # Possible values: tiles | accordion
    #  default-root-container-layout = "tiles";
    # 
    #  # Possible values: horizontal | vertical | auto
    #  default-root-container-orientation = "auto";
    #
    #  enable-normalization-flatten-containers = true;
    #  enable-normalization-opposite-orneitation-for-nested-containers = true;
    #
    #  #exec-on-workspace-change = [" "];
      
    #  key-mapping-preset = "qwerty";
    #
    #  #on-focus-changed = [" "];
    #  on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
    #  on-window-detected = [
    #    {
    #      if.window-title-regex-substring = "Orion Preview";
    #      run = []; # dont execute anything
    #    }
    #  ];

    };

}#{
