{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    [
      nerd-fonts.fira-code
    ]
    ++ lib.optionals (pkgs.stdenv.hostPlatform.isLinux || pkgs.stdenv.hostPlatform.isAarch64) [
      ghostty
    ];

  programs.ghostty = {
    enable = true;
    package =
      if pkgs.stdenv.hostPlatform.isDarwin
      then null
      else pkgs.ghostty;

    settings = {
      font-family = "Fira Code";
      font-size = "14";
      # theme = "GitHub Dark High Contrast";
    };
  };
}
