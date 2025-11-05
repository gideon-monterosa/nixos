{
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      # qml.enable = true; # Removed in nvf main branch
    };
  };
}

