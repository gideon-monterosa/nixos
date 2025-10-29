{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # File managers
    thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin

    # Communication
    discord
    teams-for-linux

    # Media
    spotify
    mpv
    imv  # Image viewer

    # Screenshot and clipboard
    grim
    slurp
    wl-clipboard
    cliphist

    # Notification daemon
    mako

    # Shell utilities
    eza
    fzf
    ripgrep
    fd
    bat
    btop

    # Utilities
    xdg-utils
    wl-clipboard-rs
    pavucontrol
  ];

  # Mako notification service
  services.mako = {
    enable = true;
    backgroundColor = "#1e1e1e";
    textColor = "#dcdfe4";
    borderColor = "#3e3e3e";
    borderRadius = 12;
    borderSize = 2;
    defaultTimeout = 5000;
    font = "Roboto 11";
    padding = "12";
    margin = "8";
  };

  # Configure thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
