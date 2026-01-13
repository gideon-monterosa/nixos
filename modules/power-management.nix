_: {
  boot.extraModprobeConfig = "options thinkpad_acpi fan_control=1";

  # Enable power management (required for hibernate/suspend)
  powerManagement.enable = true;
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=1h
  '';

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "suspend-then-hibernate";
  };

  services = {
    thinkfan = {
      enable = true;
      levels = [
        # [fan_level, low_temp, high_temp]
        [0 0 50] # Fan off
        [1 48 55]
        [2 50 60] # Slow
        [3 55 65]
        [4 60 70] # Medium
        [5 65 75]
        [6 70 80] # Fast
        [7 75 32767] # Full speed
      ];
    };

    tlp.settings = {
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 50;

      PCIE_ASPM_ON_BAT = "powersupersave";
    };

    # Disable power-profiles-daemon to avoid conflicts with TLP
    power-profiles-daemon.enable = false;

    thermald.enable = true;
  };
}
