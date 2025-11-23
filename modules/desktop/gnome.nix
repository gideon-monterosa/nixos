_: {
  services = {
    xserver.enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  systemd = {
    # Disable Orca screen reader from starting with graphical session
    user.services.orca.enable = false;

    # Workaround for GNOME autologin
    # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };
  };

  # services.displayManager.autoLogin = {
  #   enable = true;
  #   user = "gideon";
  # };
}
