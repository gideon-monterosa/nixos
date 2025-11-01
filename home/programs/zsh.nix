{pkgs, ...}: {
  home.packages = with pkgs; [
    starship
    eza
    fd
    bat
    zoxide
  ];

  programs = {
    starship.enable = true;

    bat = {
      enable = true;
      config = {
        theme = "Visual Studio Dark+";
        style = "header,grid";
        paging = "never";
      };
    };

    zsh = {
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
        # Eza aliases
        ls = "eza --icons";
        ll = "eza -la --icons --git";
        lt = "eza --tree --icons";
        la = "eza -a --icons";
        l = "eza -l --icons --git";
      };

      initContent = ''
        # Fuzzy cd function
        fcd() {
          local dir
          dir=$(fd --type d --hidden --follow --exclude .git | fzf --preview 'eza --tree --color=always {} | head -200')
          if [[ -n "$dir" ]]; then
            cd "$dir"
          fi
        }

        # Fuzzy process killer
        fkill() {
          local pid
          pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
          if [[ -n "$pid" ]]; then
            echo "$pid" | xargs kill -"''${1:-9}"
          fi
        }
      '';
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;

      defaultCommand = "fd --type f --hidden --follow --exclude .git";
      changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
      fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";

      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--preview-window=right:60%"
        "--preview 'if [[ -f {} ]]; then bat --color=always --style=header,grid --line-range :300 {}; elif [[ -d {} ]]; then eza --tree --color=always {} | head -200; fi'"
      ];
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
