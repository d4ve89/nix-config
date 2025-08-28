{ config, lib, pkgs, inputs,... }:
{
  home.username = "david";
  home.homeDirectory = lib.mkDefault "/home/david";

  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.nix-doom-emacs-unstraightened.homeModule
    inputs.stylix.homeModules.stylix
    ../../../modules/home
  ];


  # user specific packages on all hosts:
  #
 #
   #
   #
  home.packages = [
    (pkgs.writeShellApplication {
      name = "toggle-theme";
      runtimeInputs = with pkgs; [ home-manager coreutils findutils gnugrep fzf ];
      text = ''
        #!/bin/sh
        set -eu

        spec_dir=""
        for p in $(home-manager generations | grep -o '/nix/store[^ ]*'); do
          [ -d "$p/specialisation" ] && { spec_dir="$p/specialisation"; break; }
        done

        [ -z "$spec_dir" ] && { echo "No specialisation found."; exit 1; }

        spec=$(find -L "$spec_dir" -mindepth 1 -maxdepth 1 -printf '%f\n' | fzf --prompt="Select: ") || exit 0
        [ -z "$spec" ] && exit 0

        "$spec_dir/$spec/activate"

        mkdir -p "$HOME/.cache"
        date +%s > "$HOME/.cache/.theme_reload_timestamp"
        echo "Activated: $spec"
      '';
    })
  ];

  # managing dotfiles through 'home.file'.
  home.file = {
    #"${config.xdg.configHome}/.config" = {
    #  source = ../../../dotfiles/config;
    #  recursive = true;
    #};
    ".config/custom-doom/org-latex-export-dj.org".source = config.lib.file.mkOutOfStoreSymlink ../../../dotfiles/config/doom/org-latex-export-dj.org;

    #".config/ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ../../../dotfiles/config/ghostty/config;
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
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  shell_zsh = {
    enable = true;
    p10k = true;
  };

  editor_neovim = {
    enable = true;
    orgmode = true;
    animCursor = true;
  };

  editor_doom-emacs = {
    enable = true;
    holoEnable = false;
  };

  services.emacs = {
    enable = true;
  };

  #themes.opacity.enable = true;


  programs.git = {
    enable = true;
    includes = [
      {
        contents = {
          user = {
            name = "d4ve89";
            email = "37449430+d4ve89@users.noreply.github.com";
          };
        };
        #condition = "gitdir:~/gitea/"
        condition = "hasconfig:remote.*.url:*github.com*/**";
      }

      {
        contents = {
          user = {
            name = "d.djaja2";
            email = "d.djaja2@shg.schule.koeln";
          };
        };
        #condition = "gitdir:~/gitea/"
        condition = "hasconfig:remote.*.url:*gitea.apps.dj*/**";
      }
    ];
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
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.


}
