{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    xwayland-satellite
    brightnessctl
  ];

  services.wpaperd.enable = true;

  # TODO: pretty sure this does not yet work
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
    ];
    timeouts = [
      {
        timeout = 300; # 5 minutes
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
      {
        timeout = 900; # 15 minutes
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
      {
        timeout = 1800; # 30 minutes
        command = "${pkgs.systemd}/bin/systemctl hibernate";
      }
    ];
  };

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
