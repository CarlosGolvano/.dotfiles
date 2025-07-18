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
cp -r .you/config/files

# Install (or pick specific components)
./install.sh
```

## Credits

Structure and installation scripts inspired by [Phantas0s/.dotfiles](https://github.com/Phantas0s/.dotfiles). Many installation scripts adapted from this excellent repository.

