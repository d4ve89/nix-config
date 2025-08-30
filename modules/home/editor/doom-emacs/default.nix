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
    (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
    #(pkgs.python3.withPackages (ppkgs: [
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

  #buildPythonPackage {
  #    pname = "TODO";
  #    version = "TODO";
  #    src = fetchFromGitHub {
  #      owner = "TODO";
  #      repo = "TODO";
  #      rev = "v${version}";
  #      sha256 = ""; # TODO
  #    };

  config.home.file.".config/custom-doom/holo.el" = lib.mkIf config.editor_doom-emacs.holoEnable {
    text = ''
      (require 'holo-layer)
      (holo-layer-enable)
      (setq holo-layer-enable-cursor-animation t)
    '';
  };





}
