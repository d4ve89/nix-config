# DOOM EMACS home manager configuration: holo layer
{ config, pkgs, lib, ... }: 



#let
  #emacsMacport = pkgs.emacs-macport.overrideAttrs (old: {
  #  nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.autoconf pkgs.automake pkgs.libtool ];

    #installPhase = ''
    #  mkdir -p $out/bin
    #  cp -r src/emacs $out/bin/emacs
    #'';
  #});

#in {
{
  options = {
    editor_doom-emacs.enable = lib.mkEnableOption "enables doom emacs config";
    editor_doom-emacs.holoEnable = lib.mkEnableOption "enables fancy animation layer";
  };



  config.programs.doom-emacs = lib.mkIf config.editor_doom-emacs.enable {
    enable = true;
    #emacs = pkgs.emacs;
    #emacsMacport;
    emacs = pkgs.emacsMacport.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ (with pkgs; [ autoconf automake texinfo libtool pkg-config ]);
      preConfigure = (old.preConfigure or "") + ''
        ./autogen.sh
      '';
    });
    #provideEmacs = false;
    #doomLocalDir = .local/share/nix-doom;
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
    pkgs.qt6.full
  ];

  config.home.file.".config/custom-doom/holo.el" = lib.mkIf config.editor_doom-emacs.holoEnable {
    text = ''
      (require 'holo-layer)
      (setq holo-layer-python-command "${(pkgs.python3.withPackages (ps: with ps; [ pyobjc-core pyobjc-framework-Cocoa epc sexpdata six inflect pyqt6 pyqt6-sip ]))}/bin/python3")
      (setq holo-layer-enable-cursor-animation t)
      ;;(setq holo-layer-enable-type-animation  t)
      (setq holo-layer-enable-indent-rainbow t)
      ;;(setq holo-layer-type-animation-style "flame")
      (holo-layer-enable)
    '';
  };

}
