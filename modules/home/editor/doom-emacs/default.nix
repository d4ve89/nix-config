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
    extraPackages = epkgs: [
      #emacsPackages.holo-layer
    ];
  };

  config.home.packages = lib.mkIf config.editor_doom-emacs.holoEnable [
    (pkgs.python313.withPackages (ps: with ps; [
      epc
      sexpdata
      six
      inflect
      pyqt6
      pyqt6-sip
      pyobjc-core
      pyobjc-framework-Cocoa
    ]))
    #pkgs.gnustep-base
    #pkgs.qt6.qtbase
  ];

  config.home.file.".config/custom-doom/holo.el" = lib.mkIf config.editor_doom-emacs.holoEnable {
    text = ''
      ;;(add-to-list 'load-path "path-to-holo-layer")
      (require 'holo-layer)
      (holo-layer-enable)
      (setq holo-layer-enable-cursor-animation t)
    '';
  };





}
