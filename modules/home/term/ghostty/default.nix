{ config, pkgs, lib, ... }: {

  # Ghostty configuration
  config.home.file.".config/ghostty" = lib.mkIf config.term_ghostty.enable {
    source =  ./config;
    recursive = true;
    force = true;
  };
}
