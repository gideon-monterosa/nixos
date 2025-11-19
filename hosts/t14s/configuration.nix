# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/kanata.nix
    ../../modules/system/swiss-locale.nix
    ../../modules/system/sudo.nix
    ../../modules/desktop/gnome.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable fan control in thinkpad_acpi kernel module
  boot.extraModprobeConfig = "options thinkpad_acpi fan_control=1";

  # Fan control for ThinkPad
  services.thinkfan = {
    enable = true;
    levels = [
      # [fan_level, low_temp, high_temp]
      [0 0 50] # Fan off when below 50°C
      [1 48 55] # Very slow
      [2 50 60] # Slow
      [3 55 65] # Medium-low
      [4 60 70] # Medium
      [5 65 75] # Medium-high
      [6 70 80] # Fast
      [7 75 32767] # Full speed above 75°C
    ];
  };

  # Disable power-profiles-daemon to avoid conflicts with fan control
  services.power-profiles-daemon.enable = false;

  programs.niri.enable = true;

  # Define a user account. Don't forget to set a password with 'passwd'.
  users = {
    users.gideon = {
      isNormalUser = true;
      description = "gideon";
      extraGroups = ["networkmanager"];
    };

    defaultUserShell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 3";
      flake = "/home/gideon/nixos/";
    };
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
