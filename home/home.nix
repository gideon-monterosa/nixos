{
  pkgs,
  inputs,
  ...
}: {
  home = {
    username = "gideon";
    homeDirectory = "/home/gideon";

    packages = with pkgs; [
      inputs.quickshell.packages.${pkgs.system}.default # TODO also have the config in the repo
    ];

    stateVersion = "24.11";
  };

  imports = [
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/hyprland.nix
    ./programs/hyprpaper.nix
    ./programs/waybar.nix
    ./programs/cursor.nix
    ./programs/walker.nix
    ./programs/ghostty.nix
    ./programs/browser.nix
    ./programs/nvf.nix
    ./programs/zsh.nix
    ./programs/apps.nix
    ./programs/gtk.nix
    # ./programs/foot.nix # Currently deactivated
  ];
}
