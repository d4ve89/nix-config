{ pkgs, lib, ... }:
{
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  time.timeZone = lib.mkDefault "Europe/Berlin";

  #nixpkgs.config.allowUnfree = true;

  # base packages for every environment
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
    ncurses
    ripgrep
    fd
    btop
    unzip
    home-manager
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code #fira-sans fira-mono
    nerd-fonts.terminess-ttf
    nerd-fonts.symbols-only
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.iosevka
    newcomputermodern
    lmodern
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
