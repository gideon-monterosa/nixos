{ config, pkgs, ... }:

{
  home.username = "gideon";
  home.homeDirectory = "/home/gideon";

  home.packages = with pkgs; [
    firefox # TODO: use zen-browser
    foot
    fira-code # maybe change to nerd font variation
  ];

  programs.git = {
    enable = true;
    userName = "Gideon Monterosa";
    userEmail = "gideon.monterosa@gmail.com";
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode:size=12";
      };
    };
  };

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        searchCase = "smart";

        globals = {
          mapleader = " ";
          editorconfig = true;
        };

        options = {
          relativenumber = true;
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            action = "<cmd>Oil --float<cr>";
            desc = "open directory";
          }
        ];

        # lsp = {
        #   enable = true;
        # };
        #
        # languages = {
        #   # currently results in deprecation warning
        #   enableLSP = true;
        #   enableFormat = true;
        #   enableTreesitter = true;
        #
        #   nix.enable = true;
        # };

        theme = {
          enable = true;
          name = "github";
          style = "dark_high_contrast";
        };

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        navigation.harpoon = {
          enable = true;
          mappings = {
            file1 = "<leader>1";
            file2 = "<leader>2";
            file3 = "<leader>3";
            file4 = "<leader>4";
            listMarks = "<leader>h";
            markFile = "<leader>H";
          };
        };

        utility.oil-nvim = {
          enable = true;
        };
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      input.kb_layout = "ch";
      monitor = "Virtual-1, 3072x1920, auto, 2";

      general = {
        "$mainMod" = "SUPER";
        "$terminal" = "foot";
        "$browser" = "firefox";
      };

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, b, exec, $browser"

        "$mainMod, M, exit,"
        "$mainMod, Q, killactive,"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];
    };
  };

  home.stateVersion = "25.05";
}
