{
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
      scrolloff = 10;
    };

    # theme = {
    #   enable = true;
    #   name = "github";
    #   style = "dark_high_contrast";
    # };

    diagnostics = {
      enable = true;
      config.virtual_text = true;
    };

    syntaxHighlighting = true;

    luaConfigRC.custom-options = ''
      vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
        callback = function()
          vim.highlight.on_yank()
        end,
      })
    '';

    luaConfigRC.oil-keymaps = ''
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        desc = 'Close oil floating window with Esc Esc',
        group = vim.api.nvim_create_augroup('oil-keymaps', { clear = true }),
        callback = function()
          vim.keymap.set('n', '<Esc><Esc>', '<cmd>quit<cr>', {
            buffer = true,
            desc = 'Close oil floating window'
          })
        end,
      })
    '';
  };
}
