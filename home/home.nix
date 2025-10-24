{ pkgs, ... }:

{
  home = {
  username = "gideon";
    homeDirectory = "/home/gideon";

    packages = with pkgs; [
      firefox # TODO: use zen-browser
    ];

    stateVersion = "25.05";
  };

  imports = [
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/hyprpaper.nix
    ./programs/waybar.nix
    ./programs/rofi.nix
    ./programs/ghostty.nix
    ./programs/nvf.nix
  ];
}
