_: {
  services = {
    xserver.enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Disable Orca screen reader from starting with graphical session
  systemd.user.services.orca.enable = false;

  # Workaround for GNOME autologin
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # services.displayManager.autoLogin = {
  #   enable = true;
  #   user = "gideon";
  # };
}
