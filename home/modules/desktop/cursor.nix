{pkgs, ...}: {
  home.pointerCursor = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 24;

    gtk.enable = true;
    hyprcursor.enable = true;
  };

  wayland.windowManager.hyprland = {
    settings = {
      cursor.no_hardware_cursors = true;
    };
  };
}
