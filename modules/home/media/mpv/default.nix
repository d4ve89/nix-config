{ config, pkgs, lib, ... }:
{

# MPV configuration
  #config.home.file.".config/mpv" = lib.mkIf config.media_mpv.enable {
  #  source =  ./config;
  #  force = true;
  #};

  config.programs.mpv = lib.mkIf config.media_mpv.enable {
    enable = true;
    scripts = [ pkgs.mpvScripts.modernz ];
    config = {
      fs = true;
      macos-fs = false;
      macos-fs-animation-duration = 0;
      window-maximized = true;
      #keep-open = false;
    };
  };

}
