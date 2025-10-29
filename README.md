# NixOS Configuration

Gideon's personal NixOS configuration with Hyprland window manager.

## Features

- ✅ **Window Manager**: Hyprland with Wayland
- ✅ **Terminal**: Ghostty with Fira Code font
- ✅ **Browser**: Zen Browser
- ✅ **Editor**: Neovim (via nvf) with LSP, Telescope, Oil.nvim
- ✅ **Shell**: Zsh with Starship prompt, eza, fzf, bat
- ✅ **App Launcher**: Walker
- ✅ **Status Bar**: Waybar (CPU, memory, battery, audio, network)
- ✅ **Notifications**: Mako
- ✅ **Audio**: Pipewire with ALSA/PulseAudio/JACK
- ✅ **File Manager**: Thunar
- ✅ **Screenshots**: Grim + Slurp
- ✅ **Clipboard**: cliphist with history
- ✅ **Applications**: Discord, Spotify, Teams, mpv

## Quick Start

```bash
# Build and switch to the new configuration
sudo nixos-rebuild switch --flake .#nixos

# Or using nh (configured to auto-clean)
nh os switch
```

## Keybindings

### Window Management
- `Super + T` - Open terminal (Ghostty)
- `Super + B` - Open browser (Zen)
- `Super + E` - Open file manager (Thunar)
- `Super + Space` - App launcher (Walker)
- `Super + V` - Clipboard history
- `Super + Q` - Close window
- `Super + M` - Exit Hyprland
- `Super + F` - Fullscreen (keep bar)
- `Super + Shift + F` - True fullscreen
- `Super + Shift + Space` - Toggle floating
- `Super + h/j/k/l` - Move focus
- `Super + Shift + h/j/k/l` - Move window
- `Super + 1-9` - Switch workspace
- `Super + Shift + 1-9` - Move to workspace

### Screenshots
- `Print` - Screenshot selection (copy to clipboard)
- `Super + Print` - Screenshot full screen (copy to clipboard)
- `Shift + Print` - Screenshot selection (save to ~/Pictures)

### Neovim
- `Space + ff` - Find files (Telescope)
- `Space + fg` - Live grep (Telescope)
- `Space + fb` - Buffers (Telescope)
- `Space + 1-4` - Harpoon files
- `Space + h` - Harpoon list
- `-` - Open directory (Oil.nvim)
- `Esc Esc` - Save file (double tap)

## Structure

```
.
├── flake.nix                    # Main flake configuration
├── configuration.nix            # System-level configuration
├── hardware-configuration.nix   # Hardware-specific settings
├── home/
│   ├── home.nix                # Home Manager entry point
│   └── programs/               # Individual program configs
│       ├── hyprland.nix        # Window manager config
│       ├── waybar.nix          # Status bar
│       ├── nvf.nix             # Neovim config
│       ├── zsh.nix             # Shell config
│       ├── apps.nix            # Applications & utilities
│       ├── git.nix             # Git config
│       ├── ssh.nix             # SSH config
│       └── ...
└── assets/
    └── wallpaper.jpg           # Desktop wallpaper
```

## Customization

### Change Wallpaper
Replace `assets/wallpaper.jpg` with your desired wallpaper.

### SSH Keys
Configure your SSH keys in `home/programs/ssh.nix`:
```nix
identityFile = "~/.ssh/id_ed25519";
```

### Git Settings
Update your Git info in `home/programs/git.nix`.

## Maintenance

### Update System
```bash
# Update flake inputs
nix flake update

# Rebuild system
sudo nixos-rebuild switch --flake .#nixos
# or
nh os switch

# Clean old generations (keeping 3)
nix-collect-garbage --delete-older-than 7d
# or let nh auto-clean (already configured)
```

### Backup Configuration
Your NixOS configuration is declarative! Just keep this repository backed up:
```bash
git push origin main
```

## TODO

- [ ] Finish quickshell bar configuration
- [ ] Test screensharing setup
- [ ] Add more nvim plugins as needed
- [ ] Configure quickshell dotfiles in repo

## Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Example Hyprland Configs](https://wiki.hypr.land/Configuring/Example-configurations/)
