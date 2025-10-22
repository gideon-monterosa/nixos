{ pkgs, ... }:

{
  home.packages = with pkgs; [
    font-awesome
    roboto
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
        ];

        modules-right = [
          "network"
          "clock"
        ];

        "hyprland/workspaces" = {
          on-click = "activate";
        };
      };
    };

    style = ''
      * {
        font-family: "FontAwesome, Roboto";
        font-size: 14px;
        color: #dcdfe4;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces {
        background: rgba(30, 30, 30, 0.7);
        border-radius: 14px;
        padding: 2px;
        box-shadow: inset 0 1px 2px rgba(255, 255, 255, 0.04);
      }
      
      #workspaces button {
        background: transparent;
        border-radius: 14px;
      }

      #workspaces button.active {
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 
          inset 0 1px 2px rgba(255, 255, 255, 0.04)
          0 2px 6px rgba(0, 0, 0, 0.45);
      }
    '';
  };
}
