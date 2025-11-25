{
  pkgs,
  config,
  ...
}: {
  programs.niri.enable = true;

  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
  };

  environment.systemPackages = with pkgs; [
    (sddm-astronaut.override {
      themeConfig = {
        background = config.stylix.image;
        blur = false;
      };
    })
  ];
}
