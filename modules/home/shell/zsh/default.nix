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
      source = config.lib.file.mkOutOfStoreSymlink ../../../../dotfiles/config/zsh/p10k.zsh;
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
          PATH=/etc/profiles/per-user/david/bin:$PATH
          source ${config.xdg.configHome}/zsh/p10k-stylix.zsh
          source ${config.xdg.configHome}/zsh/syn_highlight-stylix.zsh
          #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${config.lib.stylix.colors.base03}"
          bindkey '^I^I' autosuggest-accept
        '';
      in 
        lib.mkMerge [zshConfigFirst zshConfigLast];

    #envExtra = ''
    #export someZshVariable="something"
      #'';
  };

}

