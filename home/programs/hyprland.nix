{ pkgs, ... }:

{
 
  # home.packages = [
  #   pkgs.apple-cursor
  # ];
  #
  # home.pointerCursor = {
  #   name    = "Apple Cursor";
  #   package = pkgs.apple-cursor;
  #   size    = 24;
  #   gtk.enable = true;
  #   x11.enable = true;
  #
  #   hyprcursor = {
  #       enable = true;
  #       size = 24;
  #   };
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input.kb_layout = "ch";
      # monitor = "Virtual-1, 3072x1920, auto, 2";
      exec-once = "waybar";

      # env = [
      #   "WLR_NO_HARDWARE_CURSORS,1"
      #   "XCURSOR_THEME,Apple Cursor"
      #   "XCURSOR_SIZE,24"
      #   "HYPRCURSOR_THEME,Apple Cursor"
      #   "HYPRCURSOR_SIZE,24"
      # ];

      decoration = {
        rounding = 12;

        blur = {
          enabled = "yes";
          size = 8;
          passes = 2;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        "$terminal" = "ghostty";
        "$browser" = "firefox";
      };

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, B, exec, $browser"

        "$mainMod, M, exit,"
        "$mainMod, Q, killactive,"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

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
    };
  };
}
