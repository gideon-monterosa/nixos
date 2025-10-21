{ config, pkgs, ... }:

{
  home.username = "gideon";
  home.homeDirectory = "/home/gideon";

  home.packages = with pkgs; [
    firefox # TODO: use zen-browser
  ];

  imports = [
    ./programs/nvf.nix
    ./programs/hyprland.nix
    ./programs/git.nix
    ./programs/foot.nix
  ];

  home.stateVersion = "25.05";
}
