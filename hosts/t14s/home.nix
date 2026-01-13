{pkgs, ...}: {
  imports = [
    ../../home/profiles/gideon
    ../../home/modules/terminal

    ../../home/modules/desktop/niri
    ../../home/modules/desktop/walker.nix

    ../../home/modules/applications/bitwarden.nix
    ../../home/modules/applications/browser.nix
    ../../home/modules/applications/nautilus.nix
    ../../home/modules/applications/teams.nix
    ../../home/modules/applications/pdf.nix
  ];

  home.packages = with pkgs; [
    btop
    fastfetch
    powertop
    typst
    zotero
  ];
}
