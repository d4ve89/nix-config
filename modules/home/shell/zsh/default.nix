# ZSH home manager configuration
{ config, pkgs, lib, ... }: {

  options = {
    shell_zsh.enable = lib.mkEnableOption "enables zsh installation";
    shell_zsh.p10k = lib.mkEnableOption "enables prompt styling";
  };

  config.home.packages = lib.mkIf config.shell_zsh.p10k [
    pkgs.zsh-powerlevel10k
  ];

  config.home.file = {
    "${config.xdg.configHome}/zsh/p10k.zsh" = lib.mkIf config.shell_zsh.p10k {
      source = config.lib.file.mkOutOfStoreSymlink ./config/p10k.zsh;
      force = true;
    };
  };

  config.programs.zsh = lib.mkIf config.shell_zsh.enable {
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
          source ${config.xdg.configHome}/zsh/p10k.zsh
        '';
        zshConfigLast = lib.mkOrder 1500 ''
          PATH=$HOME/.local/bin:/etc/profiles/per-user/david/bin:$PATH
          source ${config.xdg.configHome}/zsh/p10k-stylix.zsh
          source ${config.xdg.configHome}/zsh/syn_highlight-stylix.zsh
          #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${config.lib.stylix.colors.base03}"
          bindkey '^I^I' autosuggest-accept

          swallow_mpv() {
          # Minimize ONLY the front Ghostty window (the one that called lobster/curd)
            osascript -e '
              tell application "System Events"
                tell process "Ghostty"
                  set value of attribute "AXMinimized" of window 1 to true
                end tell
              end tell
            ' >/dev/null 2>&1 || true

            sleep 0.2   # small delay for reliability

            command mpv "$@"

            # Restore all Ghostty windows
            osascript -e '
              tell application "System Events"
                tell process "Ghostty"
                  set value of attribute "AXMinimized" of every window to false
                end tell
              end tell
              tell application "Ghostty" to activate
            ' >/dev/null 2>&1 || true
          }

          mpv() { swallow_mpv "$@"; }

          clear
        '';
      in 
        lib.mkMerge [zshConfigFirst zshConfigLast];

    #envExtra = ''
    #export someZshVariable="something"
      #'';
  };

}

