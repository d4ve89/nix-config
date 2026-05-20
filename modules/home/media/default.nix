{ lib, config, ... }: {

  options = {
    media_mpv.enable = lib.mkEnableOption "MPV media video player";
  };

  imports = [
    ./mpv
  ];


}

