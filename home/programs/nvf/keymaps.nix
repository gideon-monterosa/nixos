{
  vim.keymaps = [
    # File Management
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

    # Git Operations
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

    # LSP Navigation
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
}

