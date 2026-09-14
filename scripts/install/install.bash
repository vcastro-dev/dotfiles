#!/bin/bash

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Criando symlinks a partir de $DOTFILES..."

# WSL
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES/.bashrc_custom" ~/.bashrc_custom
mkdir -p ~/.config/nvim
ln -sf "$DOTFILES/init.lua" ~/.config/nvim/init.lua

# Windows (via Git Bash)
WINUSER=$(cmd.exe /c "echo %USERPROFILE%" 2>/dev/null | tr -d '\r')
ln -sf "$DOTFILES/.wezterm.lua" "$WINUSER/.wezterm.lua"
ln -sf "$DOTFILES/init.lua" "$WINUSER/AppData/Local/nvim/init.lua"

echo "Feito!"