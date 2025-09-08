{ config, pkgs, lib, ... }: {

  #Jankybar (alternative Darwin bar) configuration
  config.home.file.".config/sketchybar" = lib.mkIf config.wm_sketchybar.enable {
    source =  ./config;
    recursive = true;
    force = true;
  };

  config.home.packages = lib.mkIf config.wm_sketchybar.enable [
    #pkgs.sketchybar
    pkgs.sketchybar-app-font
    pkgs.lua
    pkgs.jq
    pkgs.switchaudio-osx
    pkgs.nowplaying-cli
    pkgs.sbarlua
  ];

  config.programs.sketchybar lib.mkIF config.wm_sketchybar.enable = {
   enable = true;
   service = enable;
   package = pkgs.sketchybar;
  };

  #services.sketchybar.enable = true;
  #services.sketchybar.extraPackages = [ pkgs.sketchybar-app-font jq ]

  #config.programs.sketchybar = lib.mkIf config.wm_sketchybar.enable {
  #  enable = true;
  #  package = pkgs.sketchybar;
  #  config = {
  #    source = ../../../../dotfiles/config/sketchybar;
  #    recursive = true;
  #  };
  #};

}
