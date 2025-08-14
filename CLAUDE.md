# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## NixOS Dotfiles Repository

This repository contains a complete NixOS configuration using Nix flakes and
home-manager for a personal desktop environment setup with Hyprland (Wayland compositor).

## Essential Commands

### Build and Apply Configuration

- `sudo nixos-rebuild switch --flake .` - Build and apply the NixOS configuration
- `sudo nixos-rebuild test --flake .` - Build and test configuration without
  switching boot entry
- `nix flake update` - Update all flake inputs to their latest versions
- `nix flake lock` - Update the flake.lock file

### Development Environment

- `nix develop` - Enter the development shell with pre-commit hooks
- `nix run nixpkgs#nixfmt-rfc-style -- .` - Format Nix files
- `nix run nixpkgs#deadnix -- .` - Find dead Nix code

### Pre-commit Checks

The repository uses pre-commit hooks (configured in checks.nix) that run
automatically:

- `deadnix` - Removes dead Nix code
- `nixfmt-rfc-style` - Formats Nix files according to RFC style
- `typos` - Spell checking
- `markdownlint` - Markdown linting

### Flake Operations

- `nix flake show` - Show flake outputs
- `nix flake check` - Check flake for issues

## Architecture Overview

### Flake Structure

- `flake.nix` - Main flake configuration with inputs and outputs
  using flake-parts
- `flake.lock` - Locked flake inputs
- `shell.nix` - Development shell configuration
- `checks.nix` - Pre-commit hooks and checks configuration

### Key Inputs

- `nixpkgs` - Main NixOS package repository (unstable channel)
- `home-manager` - Declarative user environment management
- `catppuccin` - Catppuccin theme integration for consistent theming
- `git-hooks` - Pre-commit hooks framework
- `flake-parts` - Modular flake architecture
- `nixpkgs-qgis-42` - Specific QGIS version pinned to a commit

### Module Organization

The configuration is split into logical modules:

**System Modules** (`modules/`):

- `boot.nix` - Boot configuration
- `cachix.nix` - Binary cache setup
- `displayManager.nix` - Display manager configuration
- `hardware.nix` - Hardware-specific configuration
- `misc.nix` - Miscellaneous system settings
- `networking.nix` - Network configuration
- `nix.nix` - Nix daemon and features configuration
- `security.nix` - Security settings
- `users.nix` - User account definitions

**Home Manager Configuration** (`modules/home/`):

- `default.nix` - Main home-manager integration with Hyprland and theming
- Application-specific configurations: `alacritty.nix`, `helix.nix`,
  `hyprland.nix`, `waybar/`, etc.
- `packages.nix` - User packages including development tools, media software,
  and utilities

### Desktop Environment

- **Window Manager**: Hyprland (Wayland compositor)
- **Theme**: Catppuccin Frappe flavor applied system-wide
- **Terminal**: Alacritty
- **Editor**: Helix
- **Shell**: Zsh with various enhancements
- **Status Bar**: Waybar
- **Application Launcher**: Wofi

### Development Setup

The configuration includes comprehensive development tooling:

- Languages: Python, TypeScript, Haskell, Nix
- Editors: Helix (primary), Emacs, VS Code Cursor, Claude Code
- Version Control: Git, Lazygit, GitHub CLI
- Terminal multiplexer: Zellij
- File management: Nautilus, directory navigation with zoxide

## Important Notes

- User account `albertodvp` has immutable password (mutableUsers = false)
- All configuration is declarative through Nix expressions
- Home-manager manages user-level configurations and dotfiles
- The system uses unstable nixpkgs for latest packages
- Wayland is the primary display protocol with XWayland compatibility
- Binary caches (Cachix) are configured for faster builds
