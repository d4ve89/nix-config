{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    ../../../modules/darwin/yabai
    #inputs.mac-app-util.darwinModules.default
    #../../../modules/darwin/doom-emacs
  ];
  # The platform the configuration will be used on.
  #nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "nixair";
  networking.localHostName = "nixair";
  environment.etc."hostname".text = "nixair";
  system.primaryUser = lib.mkDefault "david";
  users.users.david.home = "/Users/david";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.apple-sdk
    pkgs.qutebrowser
    pkgs.gh
    #pkgs.gimp
    pkgs.gzip
    pkgs.unzip
    pkgs._7zz
    pkgs.android-tools
    pkgs.logisim-evolution
    pkgs.cmake
    pkgs.rustc
    pkgs.cargo
    pkgs.go
    pkgs.gopls
    pkgs.graphviz
    pkgs.nixfmt
    pkgs.nerdfix
    pkgs.pngpaste
    pkgs.mermaid-cli
    pkgs.pdf2svg
    pkgs.pdfarranger
    pkgs.moonlight-qt
    pkgs.vlc-bin-universal
    #pkgs.pear-desktop
    #pkgs.mpv
    #pkgs.mpvScripts.uosc
    #pkgs.mermaid-cli -> homebrew
    #pkgs.emacs-macport
    pkgs.brave # chromium-browser for mermaid/puppeteer
    #pkgs.opencode
    pkgs.imagemagick
    #pkgs.xournalpp no darwin build -> homebrew
    #pkgs.ghostty-bin broken package -> homebrew
    pkgs.pandoc
    pkgs.jetbrains.idea
    #pkgs.jetbrains.jdk
    #pkgs.temurin-bin-21
    pkgs.jdk21
    pkgs.zstd
    #pkgs.openjfx
    #pkgs.jetbrains.jdk
    #pkgs.scenebuilder
    (pkgs.texlive.combine { 
      inherit (pkgs.texlive)  #scheme-small or #scheme-medium
      scheme-medium mlmodern babel enumitem soul titlesec ulem wrapfig capt-of hyperref preprint tabulary listings; })
    inputs.curd.packages.aarch64-darwin.default
    #inputs.lobster.packages.aarch64-darwin.default
    #pkgs.gnused
  ];

  fonts.packages = with pkgs; [
    corefonts
  ];


  homebrew = {
    enable = true;
    user = "david";
      brews = [
        "fzf"
        "gsed"
        "mas"
        "choose-gui"
        "coreutils"
        "mermaid-cli"
        "pngpaste"
        "swift"
        "curl"
        "mpv"
        "qt6"
        "tccutil"
        "mingw-w64"
        "caarlos0/tap/timer"
        "opencode"
      ];
      casks = [
        #"opencode-desktop"
        "drawio"
        "krita"
        "xournal++"
        "gimp"
        #"xppen-pentablet" # wrong version
        "ghostty"
        "grayjay"
        "hammerspoon"
        "desktoppr"
        "nextcloud-vfs"
        "karabiner-elements"
        #"zen"
        "font-sf-pro"
        "sf-symbols"
        "kindavim"
        "raycast"
        "bluej"
        "greenfoot"
        "scenebuilder"
        "private-internet-access"
        "microsoft-teams"
        "microsoft-onenote"
        "microsoft-word"
        "libreoffice"
        "kamillobinski/thock/thock"
        "TheBoredTeam/boring-notch/boring-notch"
        "pear-devs/pear/pear-desktop"
        #"imshuhao/kdeconnect/kdeconnect"
        #"kde-mac/kde/kdeconnect" = sod
        "soduto" # drop-in replaement for kdeconnect
        "caffeine"
      ];
      caskArgs.no_quarantine = true;
      masApps = {
        "Vimlike" = 1584519802;
        "Jamf Teacher" = 1458800229;

      };
      taps = builtins.attrNames config.nix-homebrew.taps;
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = true;
      onActivation.upgrade = true;
      global.autoUpdate = true;
      greedyCasks = true;
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
    WindowManager.EnableStandardClickToShowDesktop = false;
    dock.autohide = true;
    dock.show-recents = false;
    dock.minimize-to-application = true;
    dock.static-only = false;
	  dock.persistent-apps = [
	    #"/Applications/Zen.app"
      #"/Users/${system.primaryUser}/Home Manager Apps/Zen Browser (Twilight).app"
      #"/Users/${system.primaryUser}/Home Manager Apps/Emacs.app"
      "/Users/david/Applications/Home Manager Apps/Zen Browser (Twilight).app"
      "/Users/david/Applications/Home Manager Apps/Emacs.app"
      #"${pkgs.ghostty-bin}/Applications/Ghostty.app"
      "/Applications/Ghostty.app"
      "/opt/homebrew/Caskroom/pear-desktop/latest/YouTube Music.app"
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
      "com.apple.swipescrolldirection" = false;
	    KeyRepeat = 2;
    };
  };

  system.activationScripts = {
    switchWallpaper.text = ''
      echo >&2 "Switching wallpapers..."
      /usr/local/bin/desktoppr 0 $(find /Users/david/Pictures/wallpapers/gruvbox -type f | shuf -n 1)
    '';

    #autostartRaycast.text = ''
    extraActivation.text = ''
      osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Raycast.app", hidden:true}'
      osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Karabiner-Elements.app", hidden:true}'
      osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Nextcloud.app", hidden:false}'
    '';
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6; #1-6
}
