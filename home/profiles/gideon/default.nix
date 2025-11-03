{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "gideon";
    homeDirectory = "/home/gideon";
    stateVersion = "25.05";

    # TODO move this
    packages = with pkgs; [
      firefox # backup at the moment
      inputs.quickshell.packages.${pkgs.system}.default # TODO also have the config in the repo
      claude-code
      codex
    ];
  };
}

