{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    foot
    fira-code # maybe change to nerd font variation
  ];

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode:size=12";
      };
    };
  };
}
