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

        lineNumberMode = "number";

        startPlugins = [
          "render-markdown-nvim"
          "vim-markdown"
          "nvim-treesitter"
          pkgs.vimPlugins.smear-cursor-nvim
        ];

        extraPlugins = {
          smear_cursor = {
            package = pkgs.vimPlugins.smear-cursor-nvim;
            setup = ''require("smear_cursor").setup({})'';
            #setup = ''
              #require("smear_cursor").setup({
                #cursor_color = "#ff8800",
                #stiffness = 0.3,
                #trailing_stiffness = 0.1,
                #trailing_exponent = 5,
                #hide_target_hack - true,
                #gamma = 1,
              #})
            #'';
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

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          java.enable = true;
          html.enable = true;
          css.enable = true;
          python.enable = true;
          markdown.enable = true;
          sql.enable = true;
          ts.enable = true;
          lua.enable = true;
          clang.enable = true;
        };
      };
    };
  };
}
