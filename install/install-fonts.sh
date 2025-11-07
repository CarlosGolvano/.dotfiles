#!/usr/bin/env bash
# see https://github.com/ryanoasis/nerd-fonts#patched-fonts for many fonts

mkdir -p "$XDG_DATA_HOME/fonts"

for src in "$DOTFILES/fonts/fonts"/*; do
  ln -sf "$src" "$XDG_DATA_HOME/fonts/$(basename "$src")"
done
