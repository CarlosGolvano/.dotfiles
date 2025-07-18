# 🦆 Dotfiles

Personal Linux development environment configuration.

## What's included

- **Zsh** with intelligent completion and syntax highlighting
- **Starship prompt** with duck emoji hostname
- **Kitty terminal** with optimized keybindings
- **JetBrainsMono Nerd Font**
- **Pastel color scheme** across all components

## Structure

```
├── zsh/              # Zsh configuration and plugins
├── kitty/            # Kitty terminal config
├── config/           # Starship and other app configs
├── fonts/            # JetBrainsMono Nerd Font
├── aliases/          # Shell aliases
├── install/          # Component-specific installers
└── install.sh        # Main installer
```

## Installation

⚠️ **Backup first**: No backup system included.

```bash
# Backup current configs
cp you/config/files

# Install (or pick specific components)
./install.sh
```

