{ lib, config, ... }: {

  options = {
    term_ghostty.enable = lib.mkEnableOption "Ghostty Terminal configuration";
  };

  imports = [
    ./ghostty
  ];


}

