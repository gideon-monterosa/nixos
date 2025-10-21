{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";
  };
}
