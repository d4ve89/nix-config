{ config, pkgs, lib, ... }: {

# Jankybar (alternative Darwin bar) configuration
  config.home.file.".config/sketchybar" = lib.mkIf config.wm_jankyborders.enable {
    source = config.lib.file.mkOutOfStoreSymlink ../../../../dotfiles/sketchybar;
  };

  config.programs.sketchybar = lib.mkIf config.wm_sketchybar.enable {
    enable = true;
    package = pkgs.sketchybar;
    config = {
      source =  .config/sketchybar;
    };
  };

}
