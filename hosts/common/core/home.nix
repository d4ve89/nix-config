{ config, lib, pkgs, inputs,... }:
{
  config.home.username = "david";
  config.home.homeDirectory = lib.mkDefault "/home/david";

  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.nix-doom-emacs-unstraightened.homeModule
    ../../../modules/user/nvf/default.nix
    inputs.nix-colors.homeManagerModules.default
    ../../../modules/user/nix-colors/p10k.nix
    ../../../modules/user/nix-colors/zsh.nix
    #../modules/user/aerospace-module.nix
    inputs.stylix.homeModules.stylix
    #../../default-home.nix
  ];

  
  # user specific packages on all hosts:
  config.home.packages = [
    pkgs.zsh-powerlevel10k
  ];

  # managing dotfiles through 'home.file'.
  config.home.file = {
    #"${config.xdg.configHome}/.config" = {
    #  source = ../../../dotfiles/config;
    #  recursive = true;
    #};
  

    ".config/zsh/p10k.zsh".source = ../../../dotfiles/config/zsh/p10k.zsh;
    ".config/ghostty/config".source = ../../../dotfiles/config/ghostty/config;
    #".config/ghostty/shaders/cursor_smear.glsl".source = ../dotfiles/config/ghostty/shaders/cursor_smear.glsl;
    ".config/aerospace/aerospace.toml".source = ../../../dotfiles/config/aerospace/aerospace.toml;
    ".config/doom/splash/doom-emacs-splash-template.svg".source = ../../../dotfiles/config/doom/splash/doom-emacs-splash-template.svg;
    ".config/doom/splash/doomEmacsDoomOne.svg".source = ../../../dotfiles/config/doom/splash/doomEmacsDoomOne.svg;
    ".config/doom/splash/doomEmacsGruvbox.svg".source = ../../../dotfiles/config/doom/splash/doomEmacsGruvbox.svg;
    ".config/doom/splash/doomEmacsTokyoNight2.svg".source = ../../../dotfiles/config/doom/splash/doomEmacsTokyoNight2.svg;

    #".config/zsh/p10k-colors.zsh".source = dotfiles/.config/zsh/p10k-colors.zsh;k
    # You can also set the file content as String:
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/david/etc/profile.d/hm-session-vars.sh
  #
  config.home.sessionVariables = {
    EDITOR = "nvim";
  };

  #config.programs.ghostty = {
  #  settings = {
    #  font-size = 14;
  #    background-opacity = 0.95;
      #custom-shader = "~/.config/ghostty/shaders/cursor_smear.glsl";
  #  };
  #};

  config.services.emacs = {
    enable = true;
    
  };

  config.programs.doom-emacs = {
    enable = true;
    doomDir = ../../../dotfiles/config/doom;
    #doomDir = .config/doom;
    tangleArgs = "--all config.org";
    #tangleArgs = ".";
    extraPackages = epkgs: [
      #epkgs.doom
      epkgs.quelpa
      epkgs.quelpa-use-package
      epkgs.org
      epkgs.org-modern
      #epkgs.doom-themes
      epkgs.org-download
      epkgs.openwith
      epkgs.ob-mermaid
      epkgs.org-drawio
      epkgs.org-roam
      epkgs.org-roam-ui
      epkgs.magit
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
      (epkgs.melpaBuild {
        pname = "org-krita";
        version = "0.2.2";
        packageRequires = [ epkgs.org ];
        src = builtins.fetchTree{
          type = "github";
          owner = "lepisma";
          repo = "org-krita";
          rev = "4fff09ccf35d9b42ec3895a6a7343837a123c9a7";
        };
      })
      (epkgs.melpaBuild {
        pname = "org-xournalpp";
        version = "0.1.1";
        packageRequires = [ ];
        src = builtins.fetchTree {
          type = "gitlab";
          owner = "vherrmann";
          repo = "org-xournalpp";
          rev = "c09bd8b99d36c355d632b85ecbffb3b275802381";
        };
      })
    ];
  };
      #
  config.programs.git = {
    enable = true;
    #userName = "d.djaja";
    userName = "d4ve89";
    #userEmail = "d.djaja2@shg.schule.koeln";
    userEmail = "37449430+d4ve89@users.noreply.github.com";
    extraConfig.init.defaultBranch = "main";
    aliases = {
      pu = "push";
      ch = "checkout";
      co = "commit";
    };
  };

  config.gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "GruvboxPlus";
  };

  config.stylix = {
    enable = true;
    autoEnable = true;
    image = "~/Pictures/wallpapers/onedark/";
    #image = ~/Pictures/wallpapers/gruvbox/
    #image = pkgs.fetchurl { url= ; hash= ;};

    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    # if stylix.base16Scheme is undeclared, it generates a colorscheme based on the wallpaper.
    opacity.terminal = 0.8;
    opacity.applications = 0.8;
    targets = {
      nvf.enable = false;
      #targets.nvf.transparentBackground = true;
      emacs.enable = true;
    };
    polarity = "dark";
    fonts = {
      serif = {
        package = pkgs.ubuntu-classic;
        name = "Ubuntu Classic";
      };
  
      sansSerif = {
        package = pkgs.ubuntu-sans;
        name = "Ubuntu Sans";
      };
  
      monospace = {
        package = pkgs.nerd-fonts.terminess-ttf;
        name = "Terminess Nerd Font";
      };
  
      sizes = {
        applications = 14;
        terminal = 14;
      };
    };
  };  
  
  # colorscheming apps not targeted by stylix (p10k):
  #config.colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-medium;
  #config.colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  config.colorScheme = inputs.nix-colors.colorSchemes.onedark;
  #config.colorScheme = inputs.nix-colors.colorSchemes.github;
  #config.colorScheme = inputs.nix-colors.colorSchemes.ayu-dark;
  #config.colorScheme = inputs.nix-colors.colorSchemes.everforest;
      #xdg.mimeApps.defaultApplications = {
      #"text/plain" = [ "neovide.desktop" ];
      #"application/pdf" = [ "zathura.desktop" ];
      #"image/*" = [ "sxiv.desktop" ];
      #"video/*" = [ "mpv.desktop" ];
      #};

  config.programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    #sessionVariables = {
    #  PATH ="/etc/profiles/per-user/david/bin:$PATH";
    #};
    dotDir="${config.xdg.configHome}/zsh";
    initContent = 
      let 
        zshConfigFirst = lib.mkOrder 500 ''
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          source ~/.config/zsh/p10k.zsh
        '';
        zshConfigLast = lib.mkOrder 1500 ''
          PATH=/etc/profiles/per-user/david/bin:$PATH
          source ~/.config/zsh/p10k-nixcolors.zsh
          source ~/.config/zsh/highlight-nixcolors.zsh
          ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${config.colorScheme.palette.base03}"
          bindkey '^I^I' autosuggest-accept
        '';
      in 
        lib.mkMerge [zshConfigFirst zshConfigLast];

    #envExtra = ''
    #export someZshVariable="something"
      #'';
  };
  #config.programs.zellij.enableZshIntegration = true;

  # Let Home Manager install and manage itself.
  config.programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  config.home.stateVersion = "25.05"; # Please read the comment before changing.


}
