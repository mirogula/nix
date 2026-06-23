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

### 0. Install and configure Determinate Nix and Home Manager

- [Determinate Nix](https://docs.determinate.systems/determinate-nix/)
- [nix-darwin](https://docs.determinate.systems/guides/nix-darwin/)
- [HOme Manager (using flakes)](https://home-manager.dev/manual/26.05/index.xhtml#sec-flakes-standalone)

### 1. Clone the repository

```bash
git clone https://github.com/mirogula/nix.git ~/.config/nix
cd ~/.config/nix
```

### 2. Apply Darwin configuration

```bash
cd nix-darwin/
sudo darwin-rebuild switch --flake .
```

### 3. Apply Home Manager configuration

```bash
cd home-manager/
home-manager switch -b backup --flake .
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
- user level packages
- Application configurations
- Dotfiles configurations

## Rebuilding

To update your system after making changes:

```bash
# Update system configuration
sudo darwin-rebuild switch --flake .

# Update home configuration
home-manager switch -b backup --flake .
```

## Upgrading/Updating

### Upgrade Determinate Nix

```bash
sudo determinate-nixd upgrade
```

### Update Flakes (apps versions)

```
cd nix-darwin/

# update nix-darwin lockfile
nix flake update

# Update system configuration
sudo darwin-rebuild switch --flake .

cd ../home-manager/

# update home-manager lockfile
nix flake update

# Update home configuration
home-manager switch -b backup --flake .
```

## Misc

### Ephemeral environments

For trying and experimenting with packages without installing them, the `nix-shell` can be used.

Uase:
```bash
nix-shell -p <package1 name> <package2-name> ....
```

### Log in to Determinate Nix FlakeHub

To have access to FlakeHub flakes.

More details: [Log in to FlakeHub](https://docs.determinate.systems/determinate-nix/determinate-nixd/#login)

 The token expires after some time. To login again, execute following command:

```bash
determinate-nixd login
```


## Additional Resources

- [Nix Package Manager](https://nixos.org/)
- [nix-darwin Documentation](https://github.com/LnL7/nix-darwin)
- [home-manager Manual](https://nix-community.github.io/home-manager/)
- [NixOS Wiki](https://nixos.wiki/)
- [List of home-manager Programs](https://nix-community.github.io/home-manager/options/home-manager/programs/index.html)
- [List of Nix configuration Programs](https://github.com/NixOS/nixpkgs/tree/release-26.05/nixos/modules/programs)
- [A curated list of the best resources in the Nix community](https://github.com/nix-community/awesome-nix?tab=readme-ov-file)

## License

This configuration is provided as-is for personal use.

## Contributing

This is a personal configuration repository. Feel free to fork and adapt it for your own use.
