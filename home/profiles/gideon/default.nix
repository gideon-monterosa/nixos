{lib, pkgs, ...}: {
  home = {
    username = "gideon";
    homeDirectory =
      if pkgs.stdenv.hostPlatform.isDarwin
      then "/Users/gideon"
      else "/home/gideon";
    stateVersion = "25.05";
  };
}

