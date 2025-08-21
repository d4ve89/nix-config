{ config, lib, pkgs, inputs,... }: {

#options = {
#    themes.opacity.enable = lib.mkEnableOption "make backgrounds transparent";
#};
imports = [
  ./stylix-files/zsh.nix
  ./stylix-files/p10k.nix
];


config.gtk = {
  enable = true;
  theme.name = "adw-gtk3";
  cursorTheme.name = "Bibata-Modern-Ice";
  iconTheme.name = "GruvboxPlus";
};

config.stylix = {
  enable = true;
  autoEnable = true;
  base16Scheme = lib.mkDefault "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";
  polarity = lib.mkDefault "dark";
  programs.nvf.settings.vim.theme = lib.mkDefault "ayu";
  programs.nvf.settings.vim.style = lib.mkDefault "mirage";
  xdg.ConfigFile."doom/theme/theme.el".text = lib.mkDefault ''(load-theme 'doom-ayu-mirage t)'';
  xdg.ConfigFile."ghostty/config".text = lib.mkDefault ''
    theme = Ayu Mirage
    shell-integration = zsh
    confirm-close-surface = false
    quit-after-last-window-closed = true
    background-opacity = 0.90
    custom-shader = shaders/cursor_smear.glsl'';

  image = lib.mkDefault "~/Pictures/wallpapers/";
  opacity.terminal = 0.88;
  opacity.applications = 0.88;
  targets = {
    nvf.enable = false; # transparency issues, do it manually
    emacs.enable = false; # cannot target doom-emacs, do it manually
  };
  fonts = {
    serif = lib.mkDefault {
      package = pkgs.ubuntu-classic;
      name = "Ubuntu Classic";
    };
  
    sansSerif = lib.mkDefault {
      package = pkgs.ubuntu-sans;
      name = "Ubuntu Sans";
    };
  
    monospace = lib.mkDefault {
      package = pkgs.nerd-fonts.terminess-ttf;
      name = "Terminess Nerd Font";
    };

    sizes = lib.mkDefault {
      applications = 14;
      terminal = 14;
    };
  };
};  

config.specialisations = {
  gruvbox.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/gruvbox-dark-medium.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme = "gruvbox";
      programs.nvf.settings.vim.style = "dark";
      xdg.ConfigFile."doom/theme/custom-theme.el".text = ''(load-theme 'doom-gruvbox t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = GruvboxDark
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    gruvbox-light.configuration = {
      config.stylix.base16scheme = "$pkgs.base16-schemes/share/themes/gruvbox-light-medium.yaml";
      stylix.polarity = "light";
      programs.nvf.settings.vim.theme = "gruvbox";
      programs.nvf.settings.vim.style = "light";
      xdg.ConfigFile."doom/theme/custom-theme.el".text = ''(load-theme 'doom-gruvbox-light t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = GruvboxLight
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';

    };

    ayu-mirage.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/ayu-mirage.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme = "ayu";
      programs.nvf.settings.vim.style = "mirage";
      xdg.ConfigFile."doom/theme/theme.el".text = ''(load-theme 'doom-ayu-mirage t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = Ayu Mirage
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    ayu-light.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/ayu-light.yaml";

      stylix.polarity = "light";
      programs.nvf.settings.vim.theme = "ayu";
      programs.nvf.settings.vim.style = "light";
      xdg.ConfigFile."doom/theme/custom-theme.el".text = ''(load-theme 'doom-ayu-light t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = ayu_light
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';

    };

    ayu-dark.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/ayu-dark.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme = "ayu";
      programs.nvf.settings.vim.style = "dark";
      xdg.ConfigFile."doom/theme/theme.el".text = ''(load-theme 'doom-ayu-dark t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = Ayu
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    catppuccin-latte.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/catppuccin-latte.yaml";
      stylix.polarity = "light";
      programs.nvf.settings.vim.theme = "catppuccin";
      programs.nvf.settings.vim.style = "latte";
      xdg.ConfigFile."doom/theme/custom-theme.el".text = ''(load-theme 'doom-catppuccin-latte t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = catppuccin-latte
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    catppuccin-frappe.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/catppuccin-frappe.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme = "catppuccin";
      programs.nvf.settings.vim.style = "frappe";
      xdg.ConfigFile."doom/theme/custom-theme.el".text = ''(load-theme 'doom-catppuccin-frappe t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = catppuccin-frappe
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    catppuccin-macchiato.configuration = {
      stylix.base16scheme = "$pkgs.base16-schemes/share/themes/catppuccin-macchiato.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme = "catppuccin";
      programs.nvf.settings.vim.style = "macchiato";
      xdg.ConfigFile."doom/theme/custom-theme.el".text = ''(load-theme 'doom-catppuccin-macchiato t)'';
      xdg.ConfigFile."ghostty/config".text=''
        theme = catppuccin-macchiato
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

  };

}
