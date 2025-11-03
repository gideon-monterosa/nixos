{
  pkgs,
  lib,
  ...
}: let
  coreConfig = import ./core.nix;
  languagesConfig = import ./languages.nix;
  pluginsConfig = import ./plugins.nix;
  navigationConfig = import ./navigation.nix;
  snacksConfig = import ./snacks.nix;
  keymapsConfig = import ./keymaps.nix;

  # Merge all vim configurations
  vimConfig =
    lib.recursiveUpdate
    (lib.recursiveUpdate
      (lib.recursiveUpdate
        (lib.recursiveUpdate
          (lib.recursiveUpdate
            coreConfig.vim
            languagesConfig.vim)
          pluginsConfig.vim)
        navigationConfig.vim)
      snacksConfig.vim)
    keymapsConfig.vim;
in {
  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings = {
      vim = vimConfig;
    };
  };
}

