#!/bin/bash

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "Criando symlinks a partir de $DOTFILES..."

# WSL
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES/.bashrc_custom" ~/.bashrc_custom
mkdir -p ~/.config/nvim
ln -sf "$DOTFILES/init.lua" ~/.config/nvim/init.lua

echo "Feito!"