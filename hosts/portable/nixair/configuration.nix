{ config, pkgs, lib, inputs, outputs, ... }:
{
  #imports = [ ../../default-config.nix ]; not needed bc flake loads both

  # The platform the configuration will be used on.
  #nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "nixair";
  users.users.david.home = "/Users/david";

  environment.systemPackages = [
    pkgs.aerospace
    #pkgs.ghostty-bin broken package
    pkgs.sketchybar-app-font
    pkgs.sketchybar
    pkgs.jankyborders
    pkgs.jetbrains.idea-community-bin
    #pkgs.libreoffice no darwin-build available
    inputs.curd.packages.aarch64-darwin.default
    #pkgs.activinspire
  ];

    homebrew = {
      enable = true;
      brews = [
        "mas"
        "choose-gui"
      ];
      casks = [
        "ghostty"
        "hammerspoon"
        "nextcloud-vfs"
        "karabiner-elements"
        "dmenu-mac"
        "bluej"
        "greenfoot"
        "microsoft-teams"
        "microsoft-onenote"
        "microsoft-word"
        "libreoffice"
      ];
      masApps = {
        "Vimlike" = 1584519802;
      };
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
      global.autoUpdate = true;
  };

  system.defaults = {
    dock.autohide = true;
    dock.show-recents = false;
    dock.minimize-to-application = true;
    dock.static-only = false;
	  dock.persistent-apps = [
	    "/Applications/Orion.app"
      #"${pkgs.ghostty-bin}/Applications/Ghostty.app"
      "/Applications/Ghostty.app"
	    "/System/Applications/Mail.app"
	    "/System/Applications/Calendar.app"
    ];
	  finder = {
      FXPreferredViewStyle = "clmv";
	    AppleShowAllExtensions = true;
	    AppleShowAllFiles = true;
	    FXEnableExtensionChangeWarning = false;
	    _FXSortFoldersFirst = true;
	    _FXShowPosixPathInTitle = true;
	    ShowPathbar = true;
    };
	  loginwindow.GuestEnabled = false;
	  NSGlobalDomain = {
      AppleICUForce24HourTime = true;
	    AppleInterfaceStyle = "Dark";
	    KeyRepeat = 2;
    };
  };
  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
