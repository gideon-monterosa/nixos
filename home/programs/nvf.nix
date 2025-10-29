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
          qml.enable = true;
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
          {
            key = "<leader>ff";
            mode = "n";
            action = "<cmd>Telescope find_files<cr>";
            desc = "find files";
          }
          {
            key = "<leader>fg";
            mode = "n";
            action = "<cmd>Telescope live_grep<cr>";
            desc = "live grep";
          }
          {
            key = "<leader>fb";
            mode = "n";
            action = "<cmd>Telescope buffers<cr>";
            desc = "buffers";
          }
        ];

        statusline.lualine.enable = true;

        telescope.enable = true;

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

        luaConfigPost = ''
          -- Highlight on yank
          vim.api.nvim_create_autocmd('TextYankPost', {
            group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
            callback = function()
              vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
            end,
          })

          -- Auto-save on double Esc
          local esc_count = 0
          local esc_timer = nil
          vim.keymap.set('n', '<Esc>', function()
            esc_count = esc_count + 1
            if esc_timer then
              vim.fn.timer_stop(esc_timer)
            end
            esc_timer = vim.fn.timer_start(300, function()
              esc_count = 0
            end)
            if esc_count == 2 then
              vim.cmd('write')
              esc_count = 0
            end
          end, { noremap = true, silent = true })
        '';
      };
    };
  };
}
