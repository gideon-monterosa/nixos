{pkgs, ...}: {
  system.primaryUser = "gideon";

  environment.systemPackages = [
    pkgs.neovim
  ];

  homebrew = {
    enable = true;
    casks = [
      "arc"
      "ghostty"
      "1password"
      "scroll-reverser"
      "docker-desktop"
      "intellij-idea"
      "dataspell"
      "visual-studio-code"
      "microsoft-teams"
      "microsoft-outlook"
      "microsoft-powerpoint"
      "fujifilm-x-raw-studio"
      "shottr"
      "utm"
    ];
    masApps = {
      "Xcode" = 497799835;
    };
    onActivation.cleanup = "none";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  nix.settings.experimental-features = "nix-command flakes";

  security.sudo.extraConfig = ''
    %admin ALL=(ALL:ALL) NOPASSWD: ALL
  '';

  users.users.gideon.home = "/Users/gideon";

  system = {
    stateVersion = 6;

    defaults = {
      finder = {
        FXPreferredViewStyle = "Nlsv";
      };

      dock = {
        autohide = true;
        tilesize = 48;

        persistent-apps = [
          "/Applications/Arc.app"
          "/Applications/Ghostty.app"
          "/Applications/Microsoft Teams.app"
          "/Applications/Microsoft Outlook.app"
        ];
      };

      trackpad = {
        TrackpadThreeFingerDrag = true;
      };

      NSGlobalDomain = {
        NSAutomaticInlinePredictionEnabled = false;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  nixpkgs.hostPlatform = "x86_64-darwin";
  nixpkgs.config.allowUnfree = true;
}
