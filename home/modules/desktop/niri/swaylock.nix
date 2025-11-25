{pkgs, ...}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      # Display settings
      screenshots = true;
      clock = true;
      indicator = true;

      # Visual effects
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      fade-in = 0.2;

      # Colors (will be overridden by Stylix if configured)
      indicator-radius = 100;
      indicator-thickness = 7;

      # Grace period before requiring password
      grace = 2;
      grace-no-mouse = true;
      grace-no-touch = true;
    };
  };
}
