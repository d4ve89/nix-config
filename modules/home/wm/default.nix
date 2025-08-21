{ lib, config, ... }: {

  options = {
    wm_aerospace.enable = lib.mkEnableOption "Aerospace Tiling WM for Darwin";
    wm_jankyborders.enable = lib.mkEnableOption "Jankyborders border highlighting for Darwin";
    wm_sketchybar.enable = lib.mkEnableOption "Alternative Bar for Darwin";
  };

  imports = [
    ./aerospace
    ./sketchybar
    ./jankyborders
  ];


}

