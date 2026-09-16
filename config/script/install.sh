#!/bin/bash

DOTFILES="$(cd "$(dirname "$0")/../.." && pwd)"
CONFIG="$DOTFILES/config"

echo "Criando symlinks a partir de $DOTFILES..."

if grep -qi microsoft /proc/version 2>/dev/null; then
  # Dentro do WSL
  mkdir -p ~/.config/nvim
  ln -sf "$CONFIG/.tmux.conf" ~/.tmux.conf
  ln -sf "$CONFIG/.bashrc_custom" ~/.bashrc_custom
  ln -sf "$CONFIG/init.lua" ~/.config/nvim/init.lua
  grep -q "bashrc_custom" ~/.bashrc || echo "source $CONFIG/.bashrc_custom" >> ~/.bashrc
  cmd.exe /c del "C:\\Users\\victo\\.wezterm.lua" 2>/dev/null
  cmd.exe /c mklink "C:\\Users\\victo\\.wezterm.lua" "$(echo $CONFIG | sed 's|/mnt/d|D:|' | sed 's|/|\\\\|g')\\.wezterm.lua"
  echo "Symlinks criados!"
else
  wsl bash /mnt/d/Workspace/pessoal/dotfiles/config/script/install.sh
fi