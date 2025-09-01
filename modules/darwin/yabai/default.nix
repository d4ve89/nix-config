{ config, pkgs, lib, ... }:
{

  # Yabai Tiling WM configuration
  #config.home.file.".config/yabai" = lib.mkIf config.wm_yabai.enable {
   # source =  ../../../../dotfiles/config/yabai;
   # force = true;
  #};

  #environment.systemPackages = [
  #  pkgs.yabai
  #];

  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    #config = {
    #  focus_follows_mouse          = "autoraise";
    #  mouse_follows_focus          = "off";
    #  window_placement             = "second_child";
    #  window_opacity               = "off";
    #  window_opacity_duration      = "0.0";
    #  window_border                = "on";
    #  window_border_placement      = "inset";
    #  window_border_width          = 2;
    #  window_border_radius         = 3;
    #  active_window_border_topmost = "off";
    #  window_topmost               = "on";
    #  window_shadow                = "float";
    #  active_window_border_color   = "0xff5c7e81";
    #  normal_window_border_color   = "0xff505050";
    #  insert_window_border_color   = "0xffd75f5f";
    #  active_window_opacity        = "1.0";
    #  normal_window_opacity        = "1.0";
    #  split_ratio                  = "0.50";
    #  auto_balance                 = "on";
    #  mouse_modifier               = "fn";
    #  mouse_action1                = "move";
    #  mouse_action2                = "resize";
    #  layout                       = "bsp";
    #  top_padding                  = 14;
    #  bottom_padding               = 10;
    #  left_padding                 = 10;
    #  right_padding                = 10;
    #  window_gap                   = 12;
    #};
    config = {
        external_bar        = "all:40:0";
        mouse_follows_focus = "off";
        focus_follows_mouse = "off";
        window_zoom_persist = "off";
        window_placement    = "second_child";
        window_shadow       = "float";
        window_opacity      = "on";
        window_opacity_duration = 0.2;
        active_window_opacity = 1.0;
        normal_window_opacity = 0.8;
        window_animation_duration = 0.5;
        window_animation_easing = "ease_out_quint";
        insert_feedback_color = "0xff9dd274";
        split_ratio = 0.50;
        auto_balance = "off";
        mouse_modifier = "fn";
        mouse_action1  = "move";
        mouse_action2  = "resize";
        mouse_drop_action = "swap";
        layout = "bsp";
        top_padding = 10;
        bottom_padding = 15;
        left_padding = 15;
        right_padding = 15;
        window_gap = 12;
    };

    extraConfig = ''
    	sudo yabai --load-sa
	yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

        # rules
        yabai -m rule --add app="^(LuLu|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor)$" manage=off
        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
        yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
        yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
        yabai -m rule --add label="Select file to save to" app="^Inkscape$" title="Select file to save to" manage=off
	yabai -m rule --add app="^Emacs$" manage=on

	echo "yabai configuration loaded.."

        # Any other arbitrary config here
      '';
  };


}
