{ pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ] ++ lib.optionals (pkgs.stdenv.hostPlatform.isLinux || pkgs.stdenv.hostPlatform.isAarch64) [
    ghostty
  ];

  programs.ghostty = {
    enable = pkgs.stdenv.hostPlatform.isLinux || pkgs.stdenv.hostPlatform.isAarch64;

    settings = {
      font-family = "Fira Code";
      font-size = "12";
      theme = "GitHub-Dark-High-Contrast";
    };
  };
}
