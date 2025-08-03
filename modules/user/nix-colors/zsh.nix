{ config, ... }:
{
  home.file."highlight-nixcolors.zsh" = {
    target = ".config/zsh/highlight-nixcolors.zsh";
    text = ''
      # zsh-syntax-highlighting styles using nix-colors
      ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
      #ZSH_HIGHLIGHT_STYLES[default]=none
      typeset -gA ZSH_HIGHLIGHT_STYLES
      ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#${config.colorScheme.palette.base08}'
      ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#${config.colorScheme.palette.base0A}'
      ZSH_HIGHLIGHT_STYLES[command]='fg=#${config.colorScheme.palette.base0B}'
      ZSH_HIGHLIGHT_STYLES[builtin]='fg=#${config.colorScheme.palette.base0B}'
      ZSH_HIGHLIGHT_STYLES[alias]='fg=#${config.colorScheme.palette.base0B}'
      ZSH_HIGHLIGHT_STYLES[function]='fg=#${config.colorScheme.palette.base0D}'
      ZSH_HIGHLIGHT_STYLES[arg0]='fg=#${config.colorScheme.palette.base0B}'
      ZSH_HIGHLIGHT_STYLES[globbing]='fg=#${config.colorScheme.palette.base0E}'
      ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#${config.colorScheme.palette.base0E}'
      ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#${config.colorScheme.palette.base0F}'
      ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#${config.colorScheme.palette.base0F}'
      ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#${config.colorScheme.palette.base0C}'
      ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#${config.colorScheme.palette.base0C}'
      ZSH_HIGHLIGHT_STYLES[comment]='fg=#${config.colorScheme.palette.base03}'
      ZSH_HIGHLIGHT_STYLES[path]='fg=#${config.colorScheme.palette.base05}'
      ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#${config.colorScheme.palette.base05}'
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#${config.colorScheme.palette.base05}'
    '';
  };
}
