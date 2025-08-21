{ config, ... }:
{
  home.file."syn_highlight-stylix.zsh" = {
    target = ".config/zsh/syn_highlight-stylix.zsh";
    text = ''
      # zsh-syntax-highlighting styles using stylix base16
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
      #ZSH_HIGHLIGHT_STYLES[default]=none
      typeset -gA ZSH_HIGHLIGHT_STYLES
      ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#${config.lib.stylix.colors.base0E}'
      ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#${config.lib.stylix.colors.base0A}'
      ZSH_HIGHLIGHT_STYLES[command]='fg=#${config.lib.stylix.colors.base0B}'
      ZSH_HIGHLIGHT_STYLES[builtin]='fg=#${config.lib.stylix.colors.base0B}'
      ZSH_HIGHLIGHT_STYLES[alias]='fg=#${config.lib.stylix.colors.base0B}'
      ZSH_HIGHLIGHT_STYLES[function]='fg=#${config.lib.stylix.colors.base0D}'
      ZSH_HIGHLIGHT_STYLES[arg0]='fg=#${config.lib.stylix.colors.base0B}'
      ZSH_HIGHLIGHT_STYLES[globbing]='fg=#${config.lib.stylix.colors.base0E}'
      ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#${config.lib.stylix.colors.base0E}'
      ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#${config.lib.stylix.colors.base0F}'
      ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#${config.lib.stylix.colors.base0F}'
      ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#${config.lib.stylix.colors.base0C}'
      ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#${config.lib.stylix.colors.base0C}'
      ZSH_HIGHLIGHT_STYLES[comment]='fg=#${config.lib.stylix.colors.base03}'
      ZSH_HIGHLIGHT_STYLES[path]='fg=#${config.lib.stylix.colors.base05}'
      ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#${config.lib.stylix.colors.base05}'
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#${config.lib.stylix.colors.base03}'
    '';
  };
}
