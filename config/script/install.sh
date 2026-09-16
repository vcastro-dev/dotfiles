#!/bin/bash
set -euo pipefail

# ─────────────────────────────────────────────
# Config
# ─────────────────────────────────────────────
ENV_FILE=~/.dotfiles.env

[[ -f "$ENV_FILE" ]] || { echo " [error] $ENV_FILE não encontrado."; exit 1; }
source "$ENV_FILE"

[[ -z "${DOTFILES_WIN:-}" ]] && { echo " [error] DOTFILES_WIN não definido em $ENV_FILE"; exit 1; }

DOTFILES="$(echo "$DOTFILES_WIN" \
  | sed -E 's|^([A-Za-z]):\\|/mnt/\L\1/|' \
  | sed 's|\\|/|g')"

CONFIG="$DOTFILES/config"

# ─────────────────────────────────────────────
# Logging
# ─────────────────────────────────────────────
info()  { echo "  [info] $*"; }
ok()    { echo "    [ok] $*"; }
warn()  { echo "  [warn] $*" >&2; }
error() { echo " [error] $*" >&2; exit 1; }

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────
is_wsl() {
  grep -qi microsoft /proc/version 2>/dev/null
}

windows_user() {
  cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r\n'
}

make_link() {
  local src="$1"
  local dst="$2"

  if [[ ! -e "$src" ]]; then
    warn "Source não encontrado, pulando: $src"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    ok "Já existe: $dst"
    return
  fi

  if [[ -e "$dst" && ! -L "$dst" ]]; then
    warn "Arquivo real em $dst — movendo para ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  ln -sf "$src" "$dst"
  ok "Linkado: $dst → $src"
}

ensure_line() {
  local file="$1"
  local line="$2"
  local marker="$3"

  touch "$file"
  [[ -n "$marker" ]] && sed -i "/$marker/d" "$file"

  if ! grep -qF "$line" "$file"; then
    echo "$line" >> "$file"
    ok "Adicionado em $file"
  else
    ok "Já presente em $file"
  fi
}

# Remove entradas antigas de bashrc_custom de todos os arquivos de init
cleanup_old_entries() {
  local marker="bashrc_custom"
  for f in ~/.bashrc ~/.bash_profile ~/.profile ~/.bash_login; do
    [[ -f "$f" ]] && sed -i "/$marker/d" "$f" && ok "Limpado: $f"
  done

  # Remove /etc/profile.d/bashrc_custom.sh se existir
  if [[ -f /etc/profile.d/bashrc_custom.sh ]]; then
    sudo rm /etc/profile.d/bashrc_custom.sh
    ok "Removido: /etc/profile.d/bashrc_custom.sh"
  fi
}

make_wezterm_loader() {
  local win_user="$1"
  local dst_wsl="/mnt/c/Users/${win_user}/.wezterm.lua"
  local dotfiles_win
  dotfiles_win="$(echo "$DOTFILES" | sed -E 's|^/mnt/([a-zA-Z])|\U\1:|' | sed 's|/|\\|g')"

  cat > "$dst_wsl" << LUAEOF
dofile("${dotfiles_win}\\config\\wezterm.lua")
LUAEOF

  ok "Loader WezTerm: $dst_wsl"
}

# ─────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────
main() {
  is_wsl || error "Este script deve ser executado dentro do WSL."

  local win_user
  win_user="$(windows_user)"
  [[ -z "$win_user" ]] && error "Não foi possível detectar o usuário Windows."

  echo ""
  echo "Instalando dotfiles a partir de $DOTFILES"
  echo "Usuário Windows: $win_user"
  echo ""

  # ── Limpeza de entradas antigas ───────────
  info "Limpando entradas antigas..."
  cleanup_old_entries
  echo ""

  # ── Symlinks WSL ──────────────────────────
  info "Criando symlinks WSL..."
  make_link "$CONFIG/.tmux.conf"     ~/.tmux.conf
  make_link "$CONFIG/.bashrc_custom" ~/.bashrc_custom
  make_link "$CONFIG/init.lua"       ~/.config/nvim/init.lua
  echo ""

  # ── .bashrc ───────────────────────────────
  info "Configurando .bashrc..."
  ensure_line ~/.bashrc \
    "source $CONFIG/.bashrc_custom" \
    "bashrc_custom"
  echo ""

  # ── .bash_profile ─────────────────────────
  info "Configurando .bash_profile..."
  ensure_line ~/.bash_profile \
    '[[ -f ~/.bashrc ]] && source ~/.bashrc' \
    '.bashrc'
  echo ""

  # ── WezTerm loader ────────────────────────
  info "Criando loader WezTerm..."
  make_wezterm_loader "$win_user"
  echo ""

  echo "Instalação concluída."
  echo ""
}

main "$@"
