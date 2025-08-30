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
    ];
  };

  config.home.packages = lib.mkIf config.editor_doom-emacs.holoEnable [
    (pkgs.python3.withPackages (ps: with ps; [
      pyobjc-core
      pyobjc-framework-Cocoa
      epc
      sexpdata
      six
      inflect
      pyqt6
      pyqt6-sip
    ]))
  ];

  config.home.file.".config/custom-doom/holo.el" = lib.mkIf config.editor_doom-emacs.holoEnable {
    text = ''
      (require 'holo-layer)
      (holo-layer-enable)
      (setq holo-layer-enable-cursor-animation t)
      (setq holo-layer-python-command "${(pkgs.python3.withPackages (ps: with ps; [ pyobjc-core pyobjc-framework-Cocoa epc sexpdata six inflect pyqt6 pyqt6-sip ]))}/bin/python3")
    '';
  };





}
