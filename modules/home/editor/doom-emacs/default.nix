# DOOM EMACS home manager configuration
{ config, pkgs, lib, ... }: {

  options = {
    editor_doom-emacs.enable = lib.mkEnableOption "enables doom emacs installation";
    editor_doom-emacs.holoEnable = lib.mkEnableOption "enables fancy animation layer";
  };
 
  config.programs.doom-emacs = lib.mkIf config.editor_doom-emacs.enable {
    enable = true;
    doomDir = ../../../../dotfiles/config/doom;
    #doomDir = .config/doom;
    tangleArgs = "--all config.org"; #alt option: "."
    extraPackages = epkgs: [ ];
  };
  config.home.packages = lib.mkIf config.editor_doom-emacs.holoEnable [
    pkgs.python3Packages.epc
    pkgs.python3Packages.inflect
    pkgs.python3Packages.pygt6
    pkgs.python3Packages.pygt6-qt6
    pkgs.python3Packages.pyqt6-sip
    pkgs.python3Packages.pyqt5
    pkgs.python3Packages.pyobjc
    pkgs.python3Packages.sexpdata
    pkgs.python3Packages.six
  ];

  config.home.file.".config/custom-doom/holo.el" = lib.mkIf config.editor_doom-emacs.holoEnable {
    source = ''
      (add-to-list 'load-path "path-to-holo-layer"
      (require 'holo-layer)
      (holo-layer-enable)
    '';
  };





}
