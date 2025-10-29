_: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input.kb_layout = "ch";

      decoration = {
        rounding = 12;

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        "$terminal" = "ghostty";
        "$browser" = "zen";
        "$appswitcher" = "walker";
        "$fileManager" = "thunar";

        gaps_in = 4;
        gaps_out = 8;
      };

      exec-once = [
        "qs"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      binds.drag_threshold = 10;

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, B, exec, $browser"
        "$mainMod, SPACE, exec, $appswitcher"
        "$mainMod, E, exec, $fileManager"

        "$mainMod, M, exit,"
        "$mainMod, Q, killactive,"

        # Screenshots
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "$mainMod, Print, exec, grim - | wl-copy"
        "SHIFT, Print, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"

        # Clipboard manager
        "$mainMod, V, exec, cliphist list | walker --dmenu | cliphist decode | wl-copy"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod, f, fullscreen, 1"
        "$mainMod SHIFT, f, fullscreen, 0"
        "$mainMod SHIFT, SPACE, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, S, togglesplit,"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      bindc = [
        "$mainMod, mouse:272, togglefloating"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
