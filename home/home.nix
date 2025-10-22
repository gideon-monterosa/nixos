{ pkgs, ... }:

{
  home = {
  username = "gideon";
    homeDirectory = "/home/gideon";

    packages = with pkgs; [
      firefox # TODO: use zen-browser
    ];
  };

  imports = [
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/waybar.nix
    ./programs/rofi.nix
    ./programs/ghostty.nix
    ./programs/nvf.nix
  ];

  home.stateVersion = "25.05";
}
