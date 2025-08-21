{ config, lib, pkgs, inputs, ... }: {

# theme specialisation for toggle with activation scripts
specialisation = {
  gruvbox.configuration = {
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
      stylix.polarity = "dark";
      programs.nvf.settings.vim.theme.name = lib.mkOverride 50 "gruvbox";
      programs.nvf.settings.vim.theme.style = "dark";
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-gruvbox t)'';
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
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-gruvbox-light t)'';
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
      programs.nvf.settings.vim.theme.base16-colors = {
            base00 = config.lib.stylix.colors.base00;
            base01 = config.lib.stylix.colors.base01;
            base02 = config.lib.stylix.colors.base02;
            base03 = config.lib.stylix.colors.base03;
            base04 = config.lib.stylix.colors.base04;
            base05 = config.lib.stylix.colors.base05;
            base06 = config.lib.stylix.colors.base06;
            base07 = config.lib.stylix.colors.base07;
            base08 = config.lib.stylix.colors.base08;
            base09 = config.lib.stylix.colors.base09;
            base0A = config.lib.stylix.colors.base0A;
            base0B = config.lib.stylix.colors.base0B;
            base0C = config.lib.stylix.colors.base0C;
            base0D = config.lib.stylix.colors.base0D;
            base0E = config.lib.stylix.colors.base0E;
            base0F = config.lib.stylix.colors.base0F;
          };
      #programs.nvf.settings.vim.theme.base16-colors = lib.stylix.colors;
      #programs.nvf.settings.vim.theme.style = "mirage";
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-ayu-mirage t)'';
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
      programs.nvf.settings.vim.theme.base16-colors = {
            base00 = config.lib.stylix.colors.base00;
            base01 = config.lib.stylix.colors.base01;
            base02 = config.lib.stylix.colors.base02;
            base03 = config.lib.stylix.colors.base03;
            base04 = config.lib.stylix.colors.base04;
            base05 = config.lib.stylix.colors.base05;
            base06 = config.lib.stylix.colors.base06;
            base07 = config.lib.stylix.colors.base07;
            base08 = config.lib.stylix.colors.base08;
            base09 = config.lib.stylix.colors.base09;
            base0A = config.lib.stylix.colors.base0A;
            base0B = config.lib.stylix.colors.base0B;
            base0C = config.lib.stylix.colors.base0C;
            base0D = config.lib.stylix.colors.base0D;
            base0E = config.lib.stylix.colors.base0E;
            base0F = config.lib.stylix.colors.base0F;
          };
      #programs.nvf.settings.vim.theme.base16-colors = lib.stylix.colors;
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-ayu-light t)'';
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
      programs.nvf.settings.vim.theme.base16-colors = {
            base00 = config.lib.stylix.colors.base00;
            base01 = config.lib.stylix.colors.base01;
            base02 = config.lib.stylix.colors.base02;
            base03 = config.lib.stylix.colors.base03;
            base04 = config.lib.stylix.colors.base04;
            base05 = config.lib.stylix.colors.base05;
            base06 = config.lib.stylix.colors.base06;
            base07 = config.lib.stylix.colors.base07;
            base08 = config.lib.stylix.colors.base08;
            base09 = config.lib.stylix.colors.base09;
            base0A = config.lib.stylix.colors.base0A;
            base0B = config.lib.stylix.colors.base0B;
            base0C = config.lib.stylix.colors.base0C;
            base0D = config.lib.stylix.colors.base0D;
            base0E = config.lib.stylix.colors.base0E;
            base0F = config.lib.stylix.colors.base0F;
          };
      #programs.nvf.settings.vim.theme.base16-colors = lib.stylix.colors;
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-ayu-dark t)'';
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
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-catppuccin-latte t)'';
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
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-catppuccin-frappe t)'';
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
      home.file.".config/doom/theme/theme.el".text = ''(load-theme 'doom-catppuccin-macchiato t)'';
      home.file.".config/ghostty/config".text=''
        theme = catppuccin-macchiato
        shell-integration = zsh
        confirm-close-surface = false
        quit-after-last-window-closed = true
        background-opacity = 0.92
        custom-shader = shaders/cursor_smear.glsl'';
    };

  };

}

