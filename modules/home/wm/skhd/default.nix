{ config, pkgs, lib, ... }:
{

# Simple Keyshortcut manager
  config.home.file.".config/skhd" = lib.mkIf config.wm_skhd.enable {
    source =  ./config;
    force = true;
  };

  config.services.skhd = lib.mkIf config.wm_skhd.enable {
    enable = true;
  };

}
