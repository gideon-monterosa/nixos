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

      # Commands for different contexts
      defaultCommand = "fd --type f --hidden --follow --exclude .git";
      fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
      changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";

      # Base UI options
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
      ];

      # File picker (Ctrl+T) with bat preview
      fileWidgetOptions = [
        "--preview 'bat --color=always --style=numbers --line-range :500 {}'"
        "--bind 'ctrl-/:change-preview-window(down|hidden|)'"
      ];

      # Directory picker (Alt+C) with eza preview
      changeDirWidgetOptions = [
        "--preview 'eza --tree --color=always {} | head -200'"
      ];
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
