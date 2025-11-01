{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    fd
  ];

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

        statusline.lualine.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        binds.whichKey.enable = true;

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

        utility = {
          oil-nvim = {
            enable = true;
          };

          snacks-nvim = {
            enable = true;
            setupOpts = {
              picker.enable = true;

              scroll = {
                enable = true;
                animate = {
                  duration = {
                    step = 25;
                    total = 100;
                  };
                };
              };
            };
          };
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            action = "<cmd>Oil --float<cr>";
            desc = "open directory";
          }

          # Find Pickers
          {
            key = "<leader><leader>";
            mode = "n";
            action = "function() Snacks.picker.buffers() end";
            lua = true;
            desc = "Find Buffers";
          }

          {
            key = "<leader>fg";
            mode = "n";
            action = "function() Snacks.picker.grep() end";
            lua = true;
            desc = "Find Grep";
          }

          {
            key = "<leader>ff";
            mode = "n";
            action = ''
              function()
                local in_git_repo = vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == 'true\n'
                if in_git_repo then
                  Snacks.picker.git_files()
                else
                  Snacks.picker.files()
                end
              end
            '';
            lua = true;
            desc = "Find Files";
          }

          {
            key = "<leader>fF";
            mode = "n";
            action = "function() Snacks.picker.files() end";
            lua = true;
            desc = "Find All Files";
          }

          {
            key = "<leader>fr";
            mode = "n";
            action = "function() Snacks.picker.recent() end";
            lua = true;
            desc = "Find Recent";
          }

          {
            key = "<leader>ft";
            mode = "n";
            action = "function() Snacks.picker.todo_comments() end";
            lua = true;
            desc = "Find Todo";
          }

          # Git
          # {
          #   key = "<leader>gg";
          #   mode = "n";
          #   action = "function() Snacks.lazygit.open(opts) end";
          #   lua = true;
          #   desc = "Open LazyGit";
          # }

          {
            key = "<leader>gb";
            mode = "n";
            action = "function() Snacks.picker.git_branches() end";
            lua = true;
            desc = "Git Branches";
          }

          {
            key = "<leader>gl";
            mode = "n";
            action = "function() Snacks.picker.git_log() end";
            lua = true;
            desc = "Git Log";
          }

          {
            key = "<leader>gs";
            mode = "n";
            action = "function() Snacks.picker.git_status() end";
            lua = true;
            desc = "Git Status";
          }

          {
            key = "<leader>gS";
            mode = "n";
            action = "function() Snacks.picker.git_stash() end";
            lua = true;
            desc = "Git Stash";
          }

          {
            key = "<leader>gd";
            mode = "n";
            action = "function() Snacks.picker.git_diff() end";
            lua = true;
            desc = "Git Diff (Hunks)";
          }

          {
            key = "<leader>gf";
            mode = "n";
            action = "function() Snacks.picker.git_log_file() end";
            lua = true;
            desc = "Git Log File";
          }

          # LSP
          {
            key = "gd";
            mode = "n";
            action = "function() Snacks.picker.lsp_definitions() end";
            lua = true;
            desc = "Goto Definition";
          }

          {
            key = "gD";
            mode = "n";
            action = "function() Snacks.picker.lsp_declarations() end";
            lua = true;
            desc = "Goto Declaration";
          }

          {
            key = "gr";
            mode = "n";
            action = "function() Snacks.picker.lsp_references() end";
            lua = true;
            nowait = true;
            desc = "References";
          }

          {
            key = "gI";
            mode = "n";
            action = "function() Snacks.picker.lsp_implementations() end";
            lua = true;
            desc = "Goto Implementation";
          }

          {
            key = "gy";
            mode = "n";
            action = "function() Snacks.picker.lsp_type_definitions() end";
            lua = true;
            desc = "Goto Type Definition";
          }
        ];
      };
    };
  };
}
