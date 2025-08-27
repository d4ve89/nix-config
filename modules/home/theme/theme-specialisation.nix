{ config, lib, pkgs, inputs, ... }: {

# theme specialisation for toggle with activation scripts
specialisation = {
  gruvbox.configuration = {
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "gruvbox";
      programs.nvf.settings.vim.theme.style = "dark";
      home.file.".config/custom-doom/theme/theme.el".text = ''(load-theme 'doom-gruvbox t)'';
      home.file.".config/ghostty/config".text=''
        theme = GruvboxDark
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    gruvbox-light.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
      stylix.polarity = "light";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "gruvbox";
      programs.nvf.settings.vim.theme.style = "light";
      home.file.".config/custom-doom/theme/theme.el".text = ''(load-theme 'doom-gruvbox-light t)'';
      home.file.".config/ghostty/config".text=''
        theme = GruvboxLight
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';

    };

    ayu-mirage.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      #programs.nvf.settings.vim.theme.base16-colors = lib.stylix.colors;
      #programs.nvf.settings.vim.theme.style = "mirage";
      home.file.".config/custom-doom/theme/theme.el".text = ''(load-theme 'doom-ayu-mirage t)'';
      home.file.".config/ghostty/config".text=''
        theme = Ayu Mirage
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    ayu-light.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";
      stylix.polarity = "light";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      #programs.nvf.settings.vim.theme.base16-colors = lib.stylix.colors;
      home.file.".config/custom-doom/theme/theme.el".text = ''(load-theme 'doom-ayu-light t)'';
      home.file.".config/ghostty/config".text=''
        theme = ayu_light
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';

    };

    ayu-dark.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      #programs.nvf.settings.vim.theme.base16-colors = lib.stylix.colors;
      home.file.".config/custom-doom/theme/theme.el".text = ''(load-theme 'doom-ayu-dark t)'';
      home.file.".config/ghostty/config".text=''
        theme = Ayu
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    catppuccin-latte.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
      stylix.polarity = "light";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "catppuccin";
      programs.nvf.settings.vim.theme.style = "latte";
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'catppuccin)
        (setq catppuccin-flavor 'latte)
        (catppuccin-reload)
      '';
      home.file.".config/ghostty/config".text=''
        theme = catppuccin-latte
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    catppuccin-frappe.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "catppuccin";
      programs.nvf.settings.vim.theme.style = "frappe";
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'catppuccin)
        (setq catppuccin-flavor 'frappe)
        (catppuccin-reload)
      '';
      home.file.".config/ghostty/config".text=''
        theme = catppuccin-frappe
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    catppuccin-macchiato.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "catppuccin";
      programs.nvf.settings.vim.theme.style = "macchiato";
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'catppuccin)
        (setq catppuccin-flavor 'macchiato)
        (catppuccin-reload)
      '';
      home.file.".config/ghostty/config".text=''
        theme = catppuccin-macchiato
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };
    tokyonight-dark.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "tokyonight";
      programs.nvf.settings.vim.theme.style = "night";
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'doom-tokyo-night)
      '';
      home.file.".config/ghostty/config".text=''
        theme = tokyonight
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    snazzy.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/snazzy.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'doom-snazzy)
      '';
      home.file.".config/ghostty/config".text=''
        theme = snazzy
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    github-dark.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "github";
      programs.nvf.settings.vim.theme.style = lib.mkOverride 50 "dark";
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'base16-github-dark)
      '';
      home.file.".config/ghostty/config".text=''
        theme = "GitHub Dark"
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    monokai-pro.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'doom-monokai-pro)
      '';
      home.file.".config/ghostty/config".text=''
        theme = "Monokai Pro"
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    material.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'doom-materia :l)
      '';
      home.file.".config/ghostty/config".text=''
        theme = "MaterialDesignColors"
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    palenight.configuration = {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-palenight.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'doom-palenight)
      '';
      home.file.".config/ghostty/config".text=''
        theme = "PaleNightHC"
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    banana-blueberry.configuration = {
      stylix.base16Scheme = builtins.path {
        path = ../../../dotfiles/config/base16/banana-blueberry-trim.yaml;
      };
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'base16-summer-fruit-dark)'';
      home.file.".config/ghostty/config".text=''
        theme = "Banana Blueberry"
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

    ic-orange-ppl.configuration = {
      stylix.base16Scheme = builtins.path {
        path = ../../../dotfiles/config/base16/ic-orange-ppl-trim.yaml;
      };
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "base16";
      stylix.targets.nvf.enable = lib.mkForce true;
      home.file.".config/custom-doom/theme/theme.el".text = ''
        (setq doom-theme 'base16-summer-fruit-dark)'';
      home.file.".config/ghostty/config".text=''
        theme = "Banana Blueberry"
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };





  };

}

