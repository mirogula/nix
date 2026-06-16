# Nix Configuration

A declarative system and environment configuration using Nix, [nix-darwin](https://github.com/LnL7/nix-darwin), and [home-manager](https://github.com/nix-community/home-manager).

## Overview

This repository contains a reproducible, version-controlled setup for macOS systems using Nix ecosystem tools. The configuration is organized into two main components:

- **nix-darwin**: System-level configuration for macOS
- **home-manager**: User-level configuration for development environment and dotfiles

## Structure

```
.
├── nix-darwin/      # Darwin system configuration
├── home-manager/    # Home manager user configuration
└── README.md        # This file
```

## Prerequisites

- macOS system
- [Nix](https://nixos.org/download.html) installed
- [nix-darwin](https://github.com/LnL7/nix-darwin)
- [home-manager](https://github.com/nix-community/home-manager)

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/mirogula/nix.git ~/.config/nix-config
cd ~/.config/nix-config
```

### 2. Apply Darwin configuration

```bash
darwin-rebuild switch --flake .#hostname
```

### 3. Apply Home Manager configuration

```bash
home-manager switch --flake .#username@hostname
```

## Configuration Files

### nix-darwin

The `nix-darwin/` directory contains macOS system-level configurations including:
- System packages
- System services
- macOS-specific settings

### home-manager

The `home-manager/` directory contains user-level configurations including:
- Shell environment (.zshrc, .bashrc, etc.)
- Development tools and languages
- Application configurations
- Dotfiles

## Rebuilding

To update your system after making changes:

```bash
# Update system configuration
darwin-rebuild switch --flake .

# Update home configuration
home-manager switch --flake .
```

## Additional Resources

- [Nix Package Manager](https://nixos.org/)
- [nix-darwin Documentation](https://github.com/LnL7/nix-darwin)
- [home-manager Manual](https://nix-community.github.io/home-manager/)
- [NixOS Wiki](https://nixos.wiki/)

## License

This configuration is provided as-is for personal use.

## Contributing

This is a personal configuration repository. Feel free to fork and adapt it for your own use.
