# Quick Start Guide

## Essential Commands

### System Management
```bash
# Rebuild and switch to new configuration
sudo nixos-rebuild switch --flake .#nixos

# Using nh (recommended - auto-cleans old generations)
nh os switch

# Test configuration without switching
sudo nixos-rebuild test --flake .#nixos

# Update all flake inputs
nix flake update

# Clean old generations (keep last 3)
nix-collect-garbage --delete-older-than 7d
```

### Most Used Keybindings

| Key | Action |
|-----|--------|
| `Super + T` | Terminal |
| `Super + B` | Browser |
| `Super + E` | File Manager |
| `Super + Space` | App Launcher |
| `Super + V` | Clipboard History |
| `Super + Q` | Close Window |
| `Super + F` | Fullscreen |
| `Print` | Screenshot Selection |
| `Super + 1-9` | Switch Workspace |

### Media Keys
- `Fn + Brightness Up/Down` - Adjust screen brightness
- `Fn + Volume Up/Down/Mute` - Audio control

### Shell Aliases
```bash
ls    # eza with icons
ll    # eza long format
la    # eza all files
tree  # eza tree view
cat   # bat with syntax highlighting
```

### Neovim Quick Keys
- `Space + ff` - Find files
- `Space + fg` - Search in files
- `Space + fb` - List buffers
- `-` - File browser (Oil.nvim)
- `Esc Esc` - Save file

## First Time Setup

1. **SSH Keys**: Generate if needed
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

2. **Git**: Already configured, verify with
   ```bash
   git config --list
   ```

3. **Apply Configuration**: 
   ```bash
   cd ~/nixos
   nh os switch
   ```

4. **Screenshot Directory**: Create if it doesn't exist
   ```bash
   mkdir -p ~/Pictures
   ```

## Customization

### Change Wallpaper
Replace `assets/wallpaper.jpg` with your image.

### Modify Theme
Edit colors in `home/programs/gtk.nix` and `home/programs/waybar.nix`.

### Add Applications
Add packages to `home/programs/apps.nix` in the `home.packages` list.

### Keyboard Layout
Already set to Swiss German (`ch` layout). To change, edit:
- System: `configuration.nix` - `services.xserver.xkb.layout`
- Hyprland: `home/programs/hyprland.nix` - `input.kb_layout`

## Troubleshooting

### Configuration Won't Build
```bash
# Check syntax
nix flake check

# Build without switching
sudo nixos-rebuild build --flake .#nixos
```

### Rollback to Previous Generation
```bash
# List generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback
sudo nixos-rebuild switch --rollback
```

### Clear All Cache
```bash
sudo nix-collect-garbage -d
sudo nixos-rebuild switch --flake .#nixos
```

## Useful Links
- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.xhtml)
- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Package Search](https://search.nixos.org/packages)
