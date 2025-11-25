{pkgs, ...}: {
  services = {
    swayidle = {
      enable = true;
      extraArgs = ["-w" "-d"]; # Enable debug logging
      events = [
        {
          event = "before-sleep";
          command = "${pkgs.swaylock-effects}/bin/swaylock -f";
        }
        {
          event = "lock";
          command = "${pkgs.swaylock-effects}/bin/swaylock -f";
        }
      ];
      timeouts = [
        {
          timeout = 300; # 5 minutes
          command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
          resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
        }
        {
          timeout = 600; # 10 minutes - lock screen
          command = "${pkgs.swaylock-effects}/bin/swaylock -f";
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
  };
}
