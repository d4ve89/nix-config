#{ config, pkgs, ... }:
{ pkgs, ... }:
{
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  system.primaryUser = "david";
  time.timeZone = "Europe/Berlin";
  #i18n.defaultLocale = "en_US.UTF-8";
  #i18n.supportedLocales = [
  #  "de_DE.UTF-8/UTF8"
  #  "en_US.UTF-8/UTF-8"
  #];

  #nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim 
    tmux
    curl
    wget
    git
    btop
    home-manager
    vimPlugins.smear-cursor-nvim
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    newcomputermodern
  ];

  #stylix = {
  #enable = false;
    #image = ./wallpaper.png
    #image = pkgs.fetchurl { url= ; hash= ;};
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    # if base16Scheme is undeclared, generates a colorscheme based on wallpaper
    #polarity = "dark";
    #opacity = {
    #  terminal = 0.8;
    #};
  #};



}
