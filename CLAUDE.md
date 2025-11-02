# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose and Guidelines

This repository contains a personal NixOS configuration for learning and building an ideal development environment. Future expansion may include configurations for additional machines.

### Development Principles
- **Nix-first approach**: All configurations must follow Nix best practices and idioms
- **Minimalism**: Only add packages, services, or configurations that are actively needed and used
- **Quality over quantity**: Prioritize clean, well-structured code over feature abundance
- **Learning-focused**: This is a learning project for mastering NixOS concepts

### Change Management
- Never add unnecessary dependencies or bloat
- Always validate that new additions serve a specific, current need
- Use modular configuration patterns (separate files in `home/programs/`)
- Test changes thoroughly before committing

## System Management Commands

### NixOS Rebuild
- `sudo nixos-rebuild switch --flake .` - Apply system configuration changes
- `nh os switch` - Alternative rebuild command using nh (configured in flake)
- `nh clean` - Clean old generations (keeps 3 by default)

### Home Manager
- `home-manager switch --flake .` - Apply user environment changes
- Changes to `home/` directory require home-manager rebuild

### Development Workflow
- `nix flake update` - Update all flake inputs to latest versions
- `nix flake check` - Validate flake configuration
- `git add flake.lock` - Track lockfile changes after updates

### Important: Git Integration with NixOS Builds
**CRITICAL**: New configuration files must be added to git before running `nh os switch` or any NixOS rebuild command. Nix builds from the git tree, so untracked files will cause build failures with "path does not exist" errors.

Always run `git add <new-file>` before rebuilding when:
- Creating new files in `home/programs/`
- Adding any new configuration files referenced by imports
- The build fails with "path does not exist" errors for files you know exist

### When to Run `nh os switch`
Use `nh os switch` after making changes to NixOS configuration files when:
- Modifying system-level packages or services in `configuration.nix`
- Adding new Home Manager programs or packages in `home/` directory  
- Changing flake inputs or system-wide settings
- Any configuration change that affects both system and user environments
This command rebuilds and applies both system and Home Manager configurations simultaneously.

## Architecture Overview

This is a NixOS configuration using flakes with Home Manager integration for user environment management.

### Key Structure
- `flake.nix` - Main flake configuration with inputs and system definition
- `configuration.nix` - System-level NixOS configuration
- `home/home.nix` - Home Manager entry point for user `gideon`
- `home/programs/` - Modular program configurations

### Flake Inputs
- **nixpkgs**: NixOS 25.05 channel
- **home-manager**: User environment management (release-25.05)
- **nvf**: Neovim configuration framework (v0.8)
- **quickshell**: Custom shell/bar (replaces waybar)
- **walker**: Application launcher
- **zen-browser**: Alternative browser (pending integration)

### Window Manager Setup
- **Hyprland**: Wayland compositor with custom keybinds
- **QuickShell**: Status bar (config not yet in repo - see TODO)
- **Walker**: Application switcher (Super+Space)
- **Ghostty**: Terminal emulator (Super+T)

### Editor Configuration
Uses NVF (Neovim Flake) with:
- Leader key: Space
- File picker: Snacks picker with git-aware file finding
- LSP support for Nix and QML
- Oil.nvim for file management (-)
- Harpoon for quick file navigation (Leader+1-4)

Documentations on how to configure nvf can be found here:

https://notashelf.github.io/nvf/options.html

Dont hesetate to research the documentation or consult any other documentation to figure out how to configure nvf.

### Hardware Notes
- Configured for virtual machine (spice-vdagentd, virtio drivers)
- Swiss German keyboard layout
- Passwordless sudo for wheel group

## Common Tasks

### Adding New Programs
1. Create new file in `home/programs/`
2. Add import to `home/home.nix`
3. Run `home-manager switch --flake .`

### System Updates
1. Update flake: `nix flake update`
2. Apply changes: `nh os switch`
3. Commit lockfile changes

### Commit Message Guidelines
Follow these conventions for consistent commit messages, these guidelines have
to be followed for any git commit in this project:
- Use concise, descriptive commit messages starting with an action verb
- Examples: "add eza and fzf terminal enhancements", "configure bat with Visual Studio Dark+ theme"
- Keep the message to one line when possible
- Focus on what was added/changed, not implementation details
- Do not include AI generation watermarks or verbose descriptions

### Troubleshooting
- Check flake syntax: `nix flake check`
- View system logs: `journalctl -xe`
- Rollback system: `sudo nixos-rebuild switch --rollback`
- Rollback home-manager: `home-manager generations` then `home-manager switch --flake . --switch-generation <num>`
