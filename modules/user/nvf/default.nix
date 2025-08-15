{ pkgs, lib, ... }:

# NVF module for NVIM configuration
{
  programs.nvf = {
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
          #name = "ayu";
          #style = "light";
          #name = "base16";
          #name = lib.mkDefault "gruvbox";
          #style = lib.mkDefault "dark";
          #name = "catppuccin";
          #style = "macchiato";
          #name = "tokyonight"
          #style = "night";
          transparent = lib.mkForce true;
        };

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
          #pkgs.vimPlugins.org-roam-nvim
          pkgs.vimPlugins.smear-cursor-nvim
        ];

        extraPlugins = {
          smear_cursor = {
            package = pkgs.vimPlugins.smear-cursor-nvim;
            setup = ''require("smear_cursor").setup({})'';
          };
          orgmode = {
            package = pkgs.vimPlugins.orgmode;
            setup = ''require('orgmode').setup({
      org_agenda_files = '~/Documents/orgfiles/**/*',
      org_default_notes_file = '~/Documents/orgfiles/refile.org',
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })'';
          };
          #org-roam = {
          #package = pkgs.vimPlugins.org-roam-nvim;
          #setup = ''require("org-roam").setup({
          #        directory = "~/Documents/orgfiles",
          #        })'';
          #};
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
