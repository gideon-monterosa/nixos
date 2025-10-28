_: {
  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        searchCase = "smart";

        globals = {
          mapleader = " ";
          editorconfig = true;
        };

        options = {
          autoindent = true;
          smartindent = true;

          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;

          relativenumber = true;
        };

        theme = {
          enable = true;
          name = "github";
          style = "dark_high_contrast";
        };

        diagnostics = {
          enable = true;
          config.virtual_text = true;
        };

        syntaxHighlighting = true;

        treesitter = {
          enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
        };

        autocomplete.blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            action = "<cmd>Oil --float<cr>";
            desc = "open directory";
          }
        ];

        statusline.lualine.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        navigation.harpoon = {
          enable = true;
          mappings = {
            file1 = "<leader>1";
            file2 = "<leader>2";
            file3 = "<leader>3";
            file4 = "<leader>4";
            listMarks = "<leader>h";
            markFile = "<leader>H";
          };
        };

        utility.oil-nvim = {
          enable = true;
        };
      };
    };
  };
}
