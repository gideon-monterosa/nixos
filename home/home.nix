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
      inputs.quickshell.packages.${pkgs.system}.default
    ];

    stateVersion = "25.05";
  };

  imports = [
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/hyprpaper.nix
    ./programs/waybar.nix
    ./programs/cursor.nix
    ./programs/rofi.nix
    ./programs/ghostty.nix
    ./programs/browser.nix
    ./programs/nvf.nix
    ./programs/zsh.nix
  ];
}
