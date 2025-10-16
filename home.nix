{ config, pkgs, ... }:

{
  home.username = "gideon";
  home.homeDirectory = "/home/gideon";

  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";
  };

  home.stateVersion = "25.05";
}
