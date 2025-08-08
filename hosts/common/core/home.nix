{ config, lib, pkgs, inputs,... }:
{
  config.home.username = "david";
  config.home.homeDirectory = lib.mkDefault "/home/david";

  imports = [
    inputs.nvf.homeManagerModules.default
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
    ".config/zsh/p10k.zsh".source = ../../../dotfiles/config/zsh/p10k.zsh;
    ".config/ghostty/config".source = ../../../dotfiles/config/ghostty/config;
    #".config/ghostty/shaders/cursor_smear.glsl".source = ../dotfiles/config/ghostty/shaders/cursor_smear.glsl;
    ".config/aerospace/aerospace.toml".source = ../../../dotfiles/config/aerospace/aerospace.toml;
    #".config/zsh/p10k-colors.zsh".source = dotfiles/.config/zsh/p10k-colors.zsh;
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

  config.programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      #epkgs.doom
      epkgs.org-modern
      epkgs.org-download
      epkgs.openwith-mode
      epkgs.ob-mermaid
      epkgs.org-roam-ui
      epkgs.org-transclusion
      epkgs.org-super-agenda
      epkgs.timeblock
      epkgs.evil
    ]
  }

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
    #image = ./wallpaper.png
    #image = pkgs.fetchurl { url= ; hash= ;};

    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
    # if stylix.base16Scheme is undeclared, it generates a colorscheme based on the wallpaper.
    opacity.terminal = 0.8;
    targets.nvf = {
      enable = false;
      #targets.nvf.transparentBackground = true;
    };
    polarity = "dark";
    fonts.sizes = {
      terminal = 15;
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
