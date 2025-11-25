{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    extraArgs = ["-w" "-d"];

    events = [
      # Lock before any suspend or hibernate triggered by systemd
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
      # 5 minutes: turn off monitors
      {
        timeout = 300;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }

      # 10 minutes: lock screen
      {
        timeout = 600;
        command = "${pkgs.swaylock-effects}/bin/swaylock -f";
      }

      # 15 minutes: suspend
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl suspend-then-hibernate";
      }
    ];
  };
}
