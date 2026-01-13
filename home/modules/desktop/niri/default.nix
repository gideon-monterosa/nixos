{pkgs, ...}: let
  # Smart launch script: focus existing window or spawn on specific workspace
  focusOrSpawn = pkgs.writeShellScript "focus-or-spawn" ''
    APP_ID="$1"
    shift
    COMMAND="$@"

    # Check if window with app-id exists
    WINDOW_ID=$(${pkgs.niri}/bin/niri msg --json windows | ${pkgs.jq}/bin/jq ".[] | select(.app_id | contains(\"$APP_ID\")) | .id" | head -n1)

    if [ -n "$WINDOW_ID" ] && [ "$WINDOW_ID" != "null" ]; then
      ${pkgs.niri}/bin/niri msg action focus-window --id "$WINDOW_ID"
    else
      $COMMAND
    fi
  '';
in {
  imports = [
    ./waybar.nix
    ./swaylock.nix
    ./swayidle.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    xwayland-satellite
    brightnessctl
    jq
  ];

  services = {
    wpaperd.enable = true;
  };

  programs.niri.settings = {
    workspaces = {
      "01" = {name = "dev";};
      "02" = {name = "browser";};
      "03" = {name = "chats";};
      "04" = {name = "mail";};
    };

    input = {
      keyboard.xkb.layout = "ch";
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      focus-follows-mouse.max-scroll-amount = "0%";
    };

    outputs = {
      "eDP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 0;
          y = 0;
        };
      };
      "DP-1" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 165.0;
        };
        position = {
          x = 1920;
          y = 0;
        };
        scale = 1.0;
      };
    };

    layout = {
      gaps = 8;
      center-focused-column = "never";
      preset-column-widths = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
      ];
      default-column-width = {proportion = 0.5;};
      # Colors removed - Stylix will inject them
      focus-ring.width = 2;
      border.width = 2;
      shadow = {
        enable = true;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        color = "#0007";
      };
    };

    spawn-at-startup = [
      {command = ["xwayland-satellite"];}
      {command = ["waybar"];}
    ];

    prefer-no-csd = true;
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    window-rules = [
      {
        geometry-corner-radius = let
          r = 8.0;
        in {
          top-left = r;
          top-right = r;
          bottom-left = r;
          bottom-right = r;
        };
        clip-to-geometry = true;
      }
      {
        matches = [{app-id = "org.gnome.Nautilus";}];
        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [{app-id = "zen-beta";}];
        default-column-width = {proportion = 1.0;};
        open-on-workspace = "browser";
      }
      {
        matches = [{app-id = "teams-for-linux";}];
        default-column-width = {proportion = 1.0;};
        open-on-workspace = "chats";
      }
      {
        matches = [{app-id = "Bitwarden";}];
        open-floating = true;
        block-out-from = "screencast";
      }
    ];

    binds = {
      # Launch programs
      "Mod+Return".action.spawn = ["ghostty"];
      "Mod+B".action.spawn = ["sh" "-c" "${focusOrSpawn} zen zen"];
      "Mod+T".action.spawn = ["sh" "-c" "${focusOrSpawn} teams-for-linux teams-for-linux"];
      "Mod+Space".action.spawn = ["walker"];
      "Mod+E".action.spawn = ["nautilus"];

      # Overview mode
      "Mod+O" = {
        repeat = false;
        action.toggle-overview = [];
      };

      # Window management
      "Mod+Q" = {
        repeat = false;
        action.close-window = [];
      };
      "Mod+W" = {
        repeat = false;
        action.close-window = [];
      };
      "Mod+F".action.maximize-column = [];
      "Mod+Shift+F".action.fullscreen-window = [];

      # Focus movement
      "Mod+H".action.focus-column-left = [];
      "Mod+J".action.focus-window-down = [];
      "Mod+K".action.focus-window-up = [];
      "Mod+L".action.focus-column-right = [];

      # Move windows
      "Mod+Ctrl+H".action.move-column-left = [];
      "Mod+Ctrl+J".action.move-window-down = [];
      "Mod+Ctrl+K".action.move-window-up = [];
      "Mod+Ctrl+L".action.move-column-right = [];

      # Monitor focus
      "Mod+Shift+H".action.focus-monitor-left = [];
      "Mod+Shift+J".action.focus-monitor-down = [];
      "Mod+Shift+K".action.focus-monitor-up = [];
      "Mod+Shift+L".action.focus-monitor-right = [];

      # Move windows between monitors
      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];

      # Workspace navigation
      "Mod+U".action.focus-workspace-down = [];
      "Mod+I".action.focus-workspace-up = [];
      "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [];
      "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [];
      "Mod+Ctrl+U".action.move-column-to-workspace-down = [];
      "Mod+Ctrl+I".action.move-column-to-workspace-up = [];

      "Mod+Shift+U".action.move-workspace-down = [];
      "Mod+Shift+I".action.move-workspace-up = [];

      # Mouse wheel workspace switching
      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = [];
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = [];
      };
      "Mod+Shift+WheelScrollDown".action.focus-column-right = [];
      "Mod+Shift+WheelScrollUp".action.focus-column-left = [];
      "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = [];
      "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = [];

      # Workspace by number
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;
      "Mod+Ctrl+4".action.move-column-to-workspace = 4;
      "Mod+Ctrl+5".action.move-column-to-workspace = 5;
      "Mod+Ctrl+6".action.move-column-to-workspace = 6;
      "Mod+Ctrl+7".action.move-column-to-workspace = 7;
      "Mod+Ctrl+8".action.move-column-to-workspace = 8;
      "Mod+Ctrl+9".action.move-column-to-workspace = 9;

      # Column manipulation
      "Mod+Comma".action.consume-window-into-column = [];
      "Mod+Period".action.expel-window-from-column = [];

      # Column width presets and adjustments
      "Mod+R".action.switch-preset-column-width = [];
      "Mod+Shift+R".action.switch-preset-window-height = [];
      "Mod+Ctrl+R".action.reset-window-height = [];
      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";
      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      # Expand column
      "Mod+Ctrl+F".action.expand-column-to-available-width = [];

      # Center columns
      "Mod+C".action.center-column = [];
      "Mod+Ctrl+C".action.center-visible-columns = [];

      # Screenshots
      "Print".action.screenshot = [];
      "Ctrl+Print".action.screenshot-screen = [];
      "Alt+Print".action.screenshot-window = [];

      # Escape hatch
      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = [];
      };

      # Quit niri
      "Mod+Shift+E".action.quit = [];
      "Ctrl+Alt+Delete".action.quit = [];

      # Power off monitors
      "Mod+Shift+P".action.power-off-monitors = [];

      # Volume controls
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = ["sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"];
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = ["sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"];
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"];
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"];
      };

      # Brightness controls
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = ["brightnessctl" "--class=backlight" "set" "10%-"];
      };
    };
  };
}
