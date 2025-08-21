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

config.programs.nvf.settings.vim.theme.name = lib.mkOverride 500 "base16";
#config.programs.nvf.settings.vim.theme.base16-colors = lib.mkDefault config.lib.stylix.colors;
config.programs.nvf.settings.vim.theme.base16-colors = lib.mkDefault {
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

#config.programs.nvf.settings.vim.theme.style = lib.mkDefault "mirage";

config.home.file.".config/doom/theme/theme.el".text = lib.mkDefault ''(load-theme 'doom-ayu-mirage t)'';
config.home.file.".config/ghostty/config".text = lib.mkDefault ''
    theme = Ayu Mirage
    shell-integration = zsh
    confirm-close-surface = false
    quit-after-last-window-closed = true
    background-opacity = 0.90
    custom-shader = shaders/cursor_smear.glsl'';


}
