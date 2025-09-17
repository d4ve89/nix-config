# DOOM EMACS home manager configuration with holo-layer
{ config, pkgs, lib, ... }: 

let
  fixWindowRolePatch = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/refs/heads/master/patches/emacs-28/fix-window-role.patch";
    sha256 = "1f8423ea7e6e66c9ac6dd8e37b119972daa1264de00172a24a79a710efcb8130";
  };

  systemAppearancePatch = pkgs.fetchurl {
    url ="https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/refs/heads/master/patches/emacs-30/system-appearance.patch";
    sha256 = "9eb3ce80640025bff96ebaeb5893430116368d6349f4eb0cb4ef8b3d58477db6";
  };

  roundUndecoratedFramePatch = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/refs/heads/master/patches/emacs-30/round-undecorated-frame.patch";
    sha256 = "7451f80f559840e54e6a052e55d1100778abc55f98f1d0c038a24e25773f2874";
  };
in
{
  options = {
    editor_doom-emacs.enable = lib.mkEnableOption "enables doom emacs config";
    editor_doom-emacs.holoEnable = lib.mkEnableOption "enables fancy animation layer";
    editor_doom-emacs.animMacEnable = lib.mkEnableOption "enables animations on macos";
  };

  config.programs.doom-emacs = lib.mkIf config.editor_doom-emacs.enable {
    enable = true;
    # using  vanilla emacs + patching and building myself:
    emacs = pkgs.emacs.overrideAttrs (old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ (with pkgs; [ autoconf automake texinfo libtool pkg-config ]);
      patches = (old.patches or []) ++ [ fixWindowRolePatch systemAppearancePatch roundUndecoratedFramePatch];
      preConfigure = (old.preConfigure or "") + ''
        ./autogen.sh
      '';
    });

    # alternative: using emacs-macport from the nixpkg repo:
    #emacs = pkgs.emacsMacport.overrideAttrs (old: {
    #  nativeBuildInputs = (old.nativeBuildInputs or []) ++ (with pkgs; [ autoconf automake texinfo libtool pkg-config ]);
    #  preConfigure = (old.preConfigure or "") + ''
    #    ./autogen.sh
    #  '';
    #});:

    #provideEmacs = false; # equals no parallel binaries
    #doomLocalDir = .local/share/nix-doom;
    doomDir = ./config; # relative to the path in the git repo
    tangleArgs = "--all config.org"; #alt option: "."
    extraPackages = epkgs: [
    ];
  };

  config.home.file.".config/custom-doom/org-latex-export-dj.org" = lib.mkIf config.editor_doom-emacs.enable {
    source = ./config/org-latex-export-dj.org;
    force = true;
  };

  config.home.file.".config/xournalpp" = lib.mkIf config.editor_doom-emacs.enable {
   source = ./xournalpp;
   recursive = true;
   force = true;
  };

  config.home.file.".config/puppeteer/puppeteerConfig.json" = lib.mkIf config.editor_doom-emacs.enable {
    text = ''
      {
      "executablePath": "/run/current-system/sw/bin/brave"
      }
    '';
    force = true;
  };
  # alt: npx puppeteer browsers install chrome-headless-shell
  # "executablePath": "~/.cache/puppeteer/chrome-headless-shell/mac_arm-140.0.7339.82/chrome-headless-shell-mac-arm64/chrome-headless-shell"



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


  # if holo-layer breaks, try this alternative plugin:
  #
  #config.home.file.".config/custom-doom/EmacsMacPluginModule" = lib.mkIf config.editor_doom-emacs.animMacEnable {
  #  source = ../../../../dotfiles/config/doom/EmacsMacPluginModule;
  #  recursive = true;
  #  force = true;
  #};

 # config.home.file.".config/custom-doom/animation-macplugin.el" = lib.mkIf config.editor_doom-emacs.animMacEnable {
  #  text = ''
   #   (add-to-list 'load-path "~/.config/custom-doom/EmacsMacPluginModule")
    #  (require 'mac-plugin)
     # (use-package mac-plugin)
#
 #     ;; Need disable tool-bar
  #    ;;(when (fboundp 'tool-bar-mode)
   #   ;;  (tool-bar-mode -1))
    #  ;; If the downloaded repository directory is different from the above,
     # ;; you can specify the actual directory of the repository with macos-project-root
      #;; (setq macos-project-root '.config/custom-doom/EmacsMacPluginModule)
      #(mac-plugin-load-release)
      #(atmosphere-enable)
      #(mac-plugin-set-cursor-color "#fcc800")
      #(mac-plugin-set-shadow-opacity 1.0)
    #'';
 # };

}
