# NVIM home manager configuration
{ config, pkgs, lib, inputs, ... }: {

  options = {
    editor_neovim.enable = lib.mkEnableOption "enables nvim installation";
    editor_neovim.orgmode = lib.mkEnableOption "enables orgmode plugins";
    editor_neovim.animCursor = lib.mkEnableOption "smear effect";
  };

  let
	inherit (inputs.nvf.lib.nvim.sag) entryAfter
  in {
  config.programs.nvf = lib.mkIf config.editor_neovim.enable {
    enable = true;
    settings = {
      vim = {
        tabline.nvimBufferline = {
          enable = true;
          #setupOpts.options.close_icon = "✖";
          #settings = {
            #options = {
          #show_buffer_icons = true;
          #   show_buffer_close_icons = true;
          #   buffer_close_icon = "✖"; 
          #   modified_icon = "●"; 
          #   close_icon = ""; 
          #   separator_style = "thin";
          # };
          #}; 
        };

        theme = {
          enable = true;
          # available options: ayu,
          #name = lib.mkDefault "ayu";
          #style = lib.mkDefault "mirage";
          #name = "base16";
          #name = lib.mkDefault "gruvbox";
          #style = lib.mkDefault "dark";
          #name = "catppuccin";
          #style = "macchiato";
          #name = "tokyonight"
          #style = "night";A
          name = lib.mkOverride 800 "base16";
          #base16-colors = config.lib.stylix.colors;
          #base16-colors = lib.mkDefault config.lib.stylix.colors;
          base16-colors = lib.mkDefault {
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
          #name = "base16";
          #base16-colors = config.colorScheme.palette;
          transparent = lib.mkForce true;
        };

	luaConfigRC.transparentTheme = entryAfter [ "theme" ] 
     	# lua
     	''
       	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
       	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
       	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
       	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    	'';

        filetree.nvimTree = {
          enable = true;

        };

        notes = {
          #orgmode.enable = true;
          #orgmode.treesitter.enable = lib.mkForce false;
          #orgmode = { #alternative: neorg
          #enable = false;
            #setupOpts = {
              #org_agenda_files = [
              #  "~/Documents/org/*"
              #];
              #org_default_notes_file = 
              #  "~/Documents/org/refile.org";
              #};
          #treesitter.enable = true;
            #treesitter.orgPackage = 
            #pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
          #};
        };

        lineNumberMode = "number";

        startPlugins = [
          "render-markdown-nvim"
          "vim-markdown"
          #"nvim-treesitter"
          #pkgs.vimPlugins.nvim-treesitter.withAllGrammars
          pkgs.vimPlugins.orgmode
          pkgs.vimPlugins.org-roam-nvim
          pkgs.vimPlugins.smear-cursor-nvim
        ];

        extraPlugins = {
          smear_cursor = lib.mkIf config.editor_neovim.animCursor {
            package = pkgs.vimPlugins.smear-cursor-nvim;
            setup = ''require("smear_cursor").setup({})'';
          };
          orgmode = lib.mkIf config.editor_neovim.orgmode {
            package = pkgs.vimPlugins.orgmode;
            setup = ''require('orgmode').setup({
      org_agenda_files = '~/Documents/orgfiles/**/*',
      org_default_notes_file = '~/Documents/orgfiles/nvim-refile.org',
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })'';
          };
          org-roam = lib.mkIf config.editor_neovim.orgmode {
          package = pkgs.vimPlugins.org-roam-nvim;
          after = ["orgmode"];
          setup = ''require("org-roam").setup({
                  directory = "~/Documents/orgfiles"})'';
          };
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
    
        lsp.enable = true;

        #treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        #  org
        #];

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          java.enable = true;
          html.enable = true;
          css.enable = true;
          python.enable = true;
          markdown.enable = true;
          #org.enable = true;
          sql.enable = true;
          ts.enable = true;
          lua.enable = true;
          clang.enable = true;
        };
      };
    };
  };
}
