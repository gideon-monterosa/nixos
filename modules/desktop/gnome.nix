_: {
  # Enable X11 windowing system
  services.xserver.enable = true;

  # GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Workaround for GNOME autologin
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Enable automatic login for gideon user
  services.displayManager.autoLogin = {
    enable = true;
    user = "gideon";
  };
}
