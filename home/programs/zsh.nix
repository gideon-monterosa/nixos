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

    shellAliases = {
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      tree = "eza --tree --icons";
      cat = "bat";
    };

    initExtra = ''
      # FZF keybindings
      source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      source ${pkgs.fzf}/share/fzf/completion.zsh

      # Use fd for fzf
      export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    '';
  };

  home.packages = [ 
    pkgs.starship 
  ];

  programs.starship.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "auto";
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
      style = "numbers,changes,header";
    };
  };
}
