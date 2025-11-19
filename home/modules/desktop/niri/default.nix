{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard
    xwayland-satellite
    swaybg
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
