{ config, pkgs, lib, inputs, outputs, ... }:
{
  # The platform the configuration will be used on.
  #nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "nixwork";
  users.users.david.home = "/home/david";

  environment.systemPackages = [
    pkgs.qutebrowser
    pkgs.gzip
    pkgs.unzip
    pkgs.pngpaste
    pkgs.pdf2svg
    pkgs.mermaid-cli
    pkgs.brave # chromium-browser for mermaid/puppeteer
    pkgs.zen-browser
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
    pkgs.teams 
    pkgs.libreoffice-still
    #pkgs.temurin-bin-21
    pkgs.jdk21
    #pkgs.openjfx
    #pkgs.jetbrains.jdk
    #pkgs.scenebuilder
    (pkgs.texlive.combine { 
      inherit (pkgs.texlive)  #scheme-small or #scheme-medium
      scheme-medium mlmodern babel enumitem soul titlesec ulem wrapfig capt-of hyperref preprint tabulary listings; })
    inputs.curd.packages.x86_linux.default
  ];

  #;system.activationScripts.switchWallpaper.text = ''
  #      echo >&2 "Switching wallpapers..."
  #      /usr/local/bin/desktoppr 0 $(find /Users/david/Pictures/wallpapers/gruvbox -type f | shuf -n 1)
  #   '';



  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "25.05";
}
