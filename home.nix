{ config, pkgs, ... }:

{
  home.username = "gideon";
  home.homeDirectory = "/home/gideon";

  home.packages = with pkgs; [
  ];

  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input.kb_layout = "ch";
      monitor = "Virtual-1, 3072x1920, auto, 3";

      general = {
        "$mainMod" = "SUPER";
        "$terminal" = "foot";
        "$browser" = "";
      };

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, M, exit,"
        "$mainMod, Q, killactive,"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

      ];
    };
  };

  home.stateVersion = "25.05";
}
