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
  };
}

