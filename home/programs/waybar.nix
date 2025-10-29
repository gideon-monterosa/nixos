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
          "pulseaudio"
          "network"
          "memory"
          "cpu"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          on-click = "activate";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "network" = {
          format-wifi = " {essid}";
          format-ethernet = " Connected";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname}: {ipaddr}";
        };

        "memory" = {
          format = " {}%";
          tooltip-format = "Memory: {used:0.1f}G / {total:0.1f}G";
        };

        "cpu" = {
          format = " {usage}%";
          tooltip = true;
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = ["" "" "" "" ""];
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          states = {
            warning = 30;
            critical = 15;
          };
        };

        "clock" = {
          format = " {:%H:%M}";
          format-alt = " {:%Y-%m-%d}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
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

      #pulseaudio,
      #network,
      #memory,
      #cpu,
      #battery,
      #clock {
        background: rgba(30, 30, 30, 0.7);
        border-radius: 14px;
        padding: 2px 12px;
        margin: 4px 4px 4px 0;
      }

      #battery.warning {
        color: #f0e68c;
      }

      #battery.critical {
        color: #ff6b6b;
      }
    '';
  };
}
