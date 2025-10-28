{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    history = {
      size = 5000;
      append = true;
      share = true;
      ignoreAllDups = true;
      saveNoDups = true;
      findNoDups = true;
    };
  };

  home.packages = [ 
    pkgs.starship 
  ];

  programs.starship.enable = true;
}
