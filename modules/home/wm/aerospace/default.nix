{ config, pkgs, lib, ... }: {

# Aerospace Tiling WM configuration
  config.home.file.".config/aerospace" = lib.mkIf config.wm_aerospace.enable {
    source =  ../../../../dotfiles/config/aerospace;
  };


  config.programs.aerospace = lib.mkIf config.wm_aerospace.enable {
    enable = true;
    package = pkgs.aerospace;
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
