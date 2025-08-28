{ config, pkgs, lib, inputs, outputs, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];
  # The platform the configuration will be used on.
  #nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "nixwork";
  users.users.david.home = "/home/david";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.luks.devices."luks-e28c886c-eced-425f-9078-7fb3695a0985".device = "/dev/disk/by-uuid/e28c886c-eced-425f-9078-7fb365a0985";

  users.users.david = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    packages = with pkgs; [];
    #shell = pkgs.zsh;
  };

  services.getty.autologinUser = "david";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  security.pam.services.sudo.enable = true; 

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.zsh
    pkgs.qutebrowser
    pkgs.hyprland
    pkgs.gzip
    pkgs.unzip
    #pkgs.pngpaste
    #pkgs.pdf2svg
    pkgs.mermaid-cli
    pkgs.brave # chromium-browser for mermaid/puppeteer
    pkgs.imagemagick
    pkgs.xournalpp
    pkgs.krita
    pkgs.nextcloud-client
    pkgs.ghostty
    pkgs.pandoc
    pkgs.jetbrains.idea-community-bin
    pkgs.bluej
    pkgs.greenfoot
    pkgs.scenebuilder 
    pkgs.drawio
    #pkgs.teams 
    pkgs.libreoffice-still
    #pkgs.temurin-bin-21
    pkgs.jdk21
    #pkgs.openjfx
    #pkgs.jetbrains.jdk
    #pkgs.scenebuilder
    (pkgs.texlive.combine { 
      inherit (pkgs.texlive)  #scheme-small or #scheme-medium
      scheme-medium mlmodern babel enumitem soul titlesec ulem wrapfig capt-of hyperref preprint tabulary listings; })
    inputs.curd.packages.x86_64-linux.default
  ];

  #;system.activationScripts.switchWallpaper.text = ''
  #      echo >&2 "Switching wallpapers..."
  #      /usr/local/bin/desktoppr 0 $(find /Users/david/Pictures/wallpapers/gruvbox -type f | shuf -n 1)
  #   '';




  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.05";
}
