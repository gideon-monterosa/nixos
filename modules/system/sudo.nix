_: {
  # Sudo configuration - passwordless for wheel group
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };

    polkit.enable = true;
  };

  # Add wheel group to gideon user for sudo access
  users.users.gideon.extraGroups = ["wheel"];
}
