#!/bin/bash

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

echo "Criando symlinks a partir de $DOTFILES..."

if grep -qi microsoft /proc/version 2>/dev/null; then
  # WSL
  ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf
  ln -sf "$DOTFILES/.bashrc_custom" ~/.bashrc_custom
  mkdir -p ~/.config/nvim
  ln -sf "$DOTFILES/init.lua" ~/.config/nvim/init.lua
  echo "Symlinks WSL criados!"
else
  # Git Bash (Windows)
  WINUSER=$(echo "$USERPROFILE" | sed 's|\\|/|g' | sed 's|C:|/c|')
  mkdir -p "$WINUSER/AppData/Local/nvim"
  ln -sf "$DOTFILES/.wezterm.lua" "$WINUSER/.wezterm.lua"
  ln -sf "$DOTFILES/init.lua" "$WINUSER/AppData/Local/nvim/init.lua"
  echo "Symlinks Windows criados!"
fi