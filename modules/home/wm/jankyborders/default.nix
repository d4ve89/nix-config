{ config, pkgs, lib, ... }: {

# Border highlighting for Darwin clients

  config.services.jankyborders = lib.mkIf config.wm_jankyborders.enable {
    enable = true;
    package = pkgs.jankyborders;
    settings = {
      style = "round";
      hidpi = "off";
      active_color="0xffe2e2e3";
      inactive_color="0xff414550";
    };
  };
}
