{ config, pkgs, lib, ... }:
{

# Karabiner configuration
  config.home.file.".config/karabiner" = lib.mkIf config.wm_karabiner.enable {
    source =  ../../../../dotfiles/config/karabiner;
    force = true;
  };



}
