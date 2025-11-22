{
  pkgs,
  config,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
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

        height = 33;

        modules-left = [
          "niri/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network"
          "battery"
        ];

        "niri/workspaces" = {
          on-click = "activate";
        };

        network = {
          format-wifi = "{icon}";
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip-format = "{timeTo}";
        };
      };
    };

    style = ''
      * {
        font-family: "FontAwesome, Roboto";
        font-size: 14px;
        color: #${colors.base05};
        min-height: 0;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces {
        background: rgba(${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b}, 0.7);
        border-radius: 14px;
        padding: 2px;
      }

      #workspaces button {
        background: transparent;
        border-radius: 14px;
      }

      #workspaces button.active {
        background: rgba(${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b}, 0.25);
      }

      #network, #battery, #clock {
        background: rgba(${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b}, 0.7);
        border-radius: 14px;
        padding: 2px 10px;
        margin-left: 4px;
      }

      #battery.charging {
        color: #${colors.base0B};
      }

      #battery.warning:not(.charging) {
        color: #${colors.base09};
      }

      #battery.critical:not(.charging) {
        color: #${colors.base08};
      }

      #network.disconnected {
        color: #${colors.base03};
      }
    '';
  };
}
