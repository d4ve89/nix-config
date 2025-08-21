{ config, pkgs, lib, inputs, outputs, ... }:
{
  # The platform the configuration will be used on.
  #nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "nixair";
  users.users.david.home = "/Users/david";

  environment.systemPackages = [
    pkgs.aerospace
    pkgs.yabai
    pkgs.qutebrowser
    pkgs.gzip
    pkgs.unzip
    pkgs.pngpaste
    pkgs.pdf2svg
    #pkgs.mermaid-cli -> homebrew
    pkgs.brave # chromium-browser for mermaid/puppeteer
    pkgs.imagemagick
    #pkgs.xournalpp no darwin build -> homebrew
    #pkgs.ghostty-bin broken package -> homebrew
    pkgs.sketchybar-app-font
    pkgs.sketchybar
    pkgs.jankyborders
    pkgs.pandoc
    pkgs.jetbrains.idea-community-bin
    #pkgs.temurin-bin-21
    pkgs.jdk21
    #pkgs.openjfx
    #pkgs.jetbrains.jdk
    #pkgs.scenebuilder
    (pkgs.texlive.combine { 
      inherit (pkgs.texlive)  #scheme-small or #scheme-medium
      scheme-medium mlmodern enumitem soul titlesec ulem wrapfig capt-of hyperref preprint tabulary listings; })
    inputs.curd.packages.aarch64-darwin.default
  ];

  homebrew = {
      enable = true;
      brews = [
        "mas"
        "choose-gui"
        "coreutils"
        "mermaid-cli"
      ];
      casks = [
        "drawio"
        "krita"
        "xournal++"
        #"xppen-pentablet" # wrong version
        "ghostty"
        "hammerspoon"
        "desktoppr"
        "nextcloud-vfs"
        "karabiner-elements"
        "zen"
        "kindavim"
        "raycast"
        "dmenu-mac"
        "bluej"
        "greenfoot"
        "scenebuilder"
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

  launchd.user = {
    agents = {
      setenv = {
        command = ''
          /bin/launchctl setenv TERM xterm
          /bin/launchctl setenv TERMINFO /Applications/Ghostty.app/Contents/Resources/terminfo
          /bin/launchctl setenv JAVA_HOME ${pkgs.jdk21}
          /bin/launchctl setenv PATH_TO_FX $HOME/Downloads/jfx-sdk-21.0.8/
        '';
        serviceConfig.RunAtLoad = true;
      };
    };
  };

  #programs.doom-emacs = {
  # emacs = pkgs.emacs-macport;
  #};


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

  system.activationScripts.switchWallpaper.text = ''
         echo >&2 "Switching wallpapers..."
         /usr/local/bin/desktoppr 0 $(find /Users/david/Pictures/wallpapers/gruvbox -type f | shuf -n 1)
     '';



  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
