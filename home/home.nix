{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "gideon";
    homeDirectory = "/home/gideon";

    packages = with pkgs; [
      firefox # TODO: use zen-browser
      inputs.quickshell.packages.${pkgs.system}.default # TODO also have the config in the repo
      claude-code
    ];

    stateVersion = "25.05";
  };

  imports = [
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/hyprpaper.nix
    ./programs/quickshell.nix
    ./programs/cursor.nix
    ./programs/walker.nix
    ./programs/ghostty.nix
    ./programs/browser.nix
    ./programs/nvf.nix
    ./programs/zsh.nix
  ];
}
