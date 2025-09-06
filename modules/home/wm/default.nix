{ lib, config, ... }: {

  options = {
    wm_aerospace.enable = lib.mkEnableOption "Aerospace Tiling WM for Darwin";
    #wm_yabai.enable = lib.mkEnableOption "Yabai Tiling WM for Darwin";
    wm_skhd.enable = lib.mkEnableOption "Keyboard shortcuts";
    wm_karabiner.enable = lib.mkEnableOption "Lowlevel keyboard changes";
    wm_jankyborders.enable = lib.mkEnableOption "Jankyborders border highlighting for Darwin";
    wm_sketchybar.enable = lib.mkEnableOption "Alternative Bar for Darwin";
  };

  imports = [
    ./aerospace
    #./yabai
    ./skhd
    ./karabiner
    ./sketchybar
    ./jankyborders
  ];


}

