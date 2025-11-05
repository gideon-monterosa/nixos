{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    # # Native messaging hosts for Bitwarden browser integration
    # nativeMessagingHosts = with pkgs; [
    #   bitwarden-desktop
    # ];
    #
    # # Minimal privacy-focused policies
    # policies = {
    #   DisableTelemetry = true;
    #   DisablePocket = true;
    #   EnableTrackingProtection = {
    #     Value = true;
    #     Locked = true;
    #     Cryptomining = true;
    #     Fingerprinting = true;
    #   };
    #   DontCheckDefaultBrowser = true;
    # };
    #
    # # Default profile with extensions
    # profiles.default = {
    #   id = 0;
    #   isDefault = true;
    #
    #   # Declaratively installed extensions
    #   extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
    #     bitwarden
    #     ublock-origin
    #   ];
    # };
  };
}
