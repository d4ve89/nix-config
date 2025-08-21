{ config, lib, pkgs, inputs,... }:
{
  config.home.username = "david";
  config.home.homeDirectory = lib.mkDefault "/home/david";

  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.nix-doom-emacs-unstraightened.homeModule
    inputs.stylix.homeModules.stylix
    ../../../modules/home
    #../../../modules/user/nvf/default.nix
    #${inputs.self}/modules/user/nvf/default.nix
    #inputs.nix-colors.homeManagerModules.default
    #../../../modules/user/nix-colors/p10k.nix
    #../../../modules/user/nix-colors/zsh.nix
    #../modules/user/aerospace-module.nix
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
    ".config/doom/org-latex-export-dj.org".source = config.lib.file.mkOutOfStoreSymlink ../../../dotfiles/config/doom/org-latex-export-dj.org;
    ".config/ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ../../../dotfiles/config/ghostty/config;
    #".config/ghostty/shaders/cursor_smear.glsl".source = ../dotfiles/config/ghostty/shaders/cursor_smear.glsl;
    #".config/jankyborders/jankyborders.toml".source = config.lib.file.mkOutOfStoreSymlink ../../../dotfiles/config/jankyborders/jankyborders

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
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #  /etc/profiles/per-user/david/etc/profile.d/hm-session-vars.sh
  #
  config.home.sessionVariables = {
    EDITOR = "nvim";
  };

  config.shell_zsh = {
    enable = true;
    p10k = true;
  };

  config.editor_neovim = {
    enable = true;
    orgmode = true;
    animCursor = true;
  };

  config.editor_doom-emacs.enable = true;

  config.services.emacs = {
    enable = true;
  };

  config.themes.opacity.enable = true;


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


  # use different themes by selecting specialisation
  # e.g. sudo darwin-rebuild switch --specialisation gruvbox
  # or sudo nixos-rebuild switch --specialisation gruvbox
  #
  # available specialisations:
  # gruvbox(-light), ayu-mirage/light, catppuccin-latte/frappe/macchiato
  #
  #A
  #

      #xdg.mimeApps.defaultApplications = {
      #"text/plain" = [ "neovide.desktop" ];
      #"application/pdf" = [ "zathura.desktop" ];
      #"image/*" = [ "sxiv.desktop" ];
      #"video/*" = [ "mpv.desktop" ];
      #};
      #
  #config.programs.zellij.enableZshIntegration = true;

  # Let Home Manager install and manage itself.
  config.programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  config.home.stateVersion = "25.05"; # Please read the comment before changing.


}
