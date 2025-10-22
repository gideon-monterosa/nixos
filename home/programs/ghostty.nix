{ pkgs, ...}:

{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "Fira Code";
      font-size = "12";
      theme = "GitHub-Dark-High-Contrast";
    };
  };
}
