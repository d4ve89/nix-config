# DOOM EMACS home manager configuration
{ config, pkgs, lib, ... }: {

  options = {
    editor_doom-emacs.enable = lib.mkEnableOption "enables doom emacs installation";
  };
 
  config.programs.doom-emacs = lib.mkIf config.editor_doom-emacs.enable {
    enable = true;
    doomDir = ../../../../dotfiles/config/doom;
    #doomDir = .config/doom;
    tangleArgs = "--all config.org"; #alt option: "."
    extraPackages = epkgs: [
      #epkgs.doom
      epkgs.quelpa
      epkgs.quelpa-use-package
      epkgs.org
      #epkgs.org-faces
      epkgs.org-modern
      epkgs.olivetti
      epkgs.doom-themes
      epkgs.catppuccin-theme
      epkgs.base16-theme
      epkgs.org-download
      epkgs.openwith
      epkgs.ob-mermaid
      epkgs.org-drawio
      epkgs.org-roam
      epkgs.org-roam-ui
      epkgs.magit
      epkgs.org-present
      #epkgs.md-roam
      epkgs.org-transclusion
      epkgs.org-super-agenda
      epkgs.time-block
      epkgs.treemacs
      epkgs.treemacs-magit
      epkgs.treemacs-evil
      epkgs.treemacs-projectile
      epkgs.treemacs-persp
      epkgs.treemacs-tab-bar
      epkgs.lsp-treemacs
      epkgs.beacon
      epkgs.evil
      epkgs.evil-tutor
      epkgs.org-tree-slide
      epkgs.visual-fill-column
      #(epkgs.melpaBuild { 
      #  pname = "org-krita";
      #  version = "0.2.2";
      #  packageRequires = [ epkgs.org ];
      #  src = builtins.fetchTree{
      #    type = "github";
      #    owner = "lepisma"; # upstream
      #    repo = "org-krita";
      #    rev = "4fff09ccf35d9b42ec3895a6a7343837a123c9a7";
      # };
      #  files = ''("*.el" "resources")'';
      #})
      (epkgs.melpaBuild { # librephoenix' fork
        pname = "org-krita";
        version = "0.2.1";
        packageRequires = [ epkgs.org ];
        src = builtins.fetchTree{
          type = "github";
          owner = "librephoenix"; # fork
          repo = "org-krita";
          rev = "9a1d917d2ee0fb7d2403186a0e6a15e23089c9fb";
       };
        files = ''("*.el" "resources")'';
      })

      (epkgs.melpaBuild {
        pname = "org-xournalpp";
        version = "0.1.1";
        packageRequires = [ epkgs.org ];
        src = builtins.fetchTree {
          type = "gitlab";
          owner = "vherrmann";
          repo = "org-xournalpp";
          rev = "c09bd8b99d36c355d632b85ecbffb3b275802381";
        };
        files = ''("*.el" "resources")'';
      })

      (epkgs.melpaBuild {
        pname = "org-xopp";
        version = "0.0.1";
        packageRequires = [ epkgs.org ];
        src = builtins.fetchTree {
          type = "github";
          owner = "mahmoodsh36";
          repo = "org-xopp";
          rev = "cef73dd97d39a70dde8fbe5b5eeab3c42fed8f97";
        };
        files = ''(:defaults "*.sh")'';
      })

      # (epkgs.trivialBuild (
      #     with config.lib.stylix.colors.withHashtag;
      #     {
      #       pname = "base16-stylix-theme";
      #       version = "0.1.0";
      #       src = pkgs.writeText "base16-stylix-theme.el" ''
      #         (require 'base16-theme)
      #         (defvar base16-stylix-theme-colors
      #           '(:base00 "${base00}"
      #             :base01 "${base01}"
      #             :base02 "${base02}"
      #             :base03 "${base03}"
      #             :base04 "${base04}"
      #             :base05 "${base05}"
      #             :base06 "${base06}"
      #             :base07 "${base07}"
      #             :base08 "${base08}"
      #             :base09 "${base09}"
      #             :base0A "${base0A}"
      #             :base0B "${base0B}"
      #             :base0C "${base0C}"
      #             :base0D "${base0D}"
      #             :base0E "${base0E}"
      #             :base0F "${base0F}")
      #           "All colors for Base16 stylix are defined here.")

      #         ;; Define the theme
      #         (deftheme base16-stylix)

      #         ;; Add all the faces to the theme
      #         (base16-theme-define 'base16-stylix base16-stylix-theme-colors)

      #         ;; Mark the theme as provided
      #         (provide-theme 'base16-stylix)

      #         ;; Add path to theme to theme-path
      #         (add-to-list 'custom-theme-load-path
      #             (file-name-directory
      #                 (file-truename load-file-name)))
      #         ;; Set font

      #         (provide 'base16-stylix-theme)
      #       '';

      #       packageRequires = [ epkgs.base16-theme ];

      #     }

      #   ))
    ];
  };
}
