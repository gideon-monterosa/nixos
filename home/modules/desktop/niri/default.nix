{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    xwayland-satellite
    swaybg

    # Power management and monitoring tools
    powertop       # Power usage analysis
    tlp            # TLP CLI tools (tlp-stat)
    acpi           # Battery status
    brightnessctl  # Backlight control
  ];

  # Idle management for Niri
  services.swayidle = {
    enable = true;
    events = [
      { event = "before-sleep"; command = "${pkgs.systemd}/bin/loginctl lock-session"; }
    ];
    timeouts = [
      {
        timeout = 300;  # 5 minutes
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
      {
        timeout = 900;  # 15 minutes
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
      {
        timeout = 1800;  # 30 minutes
        command = "${pkgs.systemd}/bin/systemctl hibernate";
      }
    ];
  };

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."wallpaper.jpg".source = ../../../../assets/wallpaper.jpg;
}
