#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
AI_DIR="$DOTFILES_DIR/ai"
CLAUDE_CONFIG_DIR="$HOME/.claude"

echo "→ Configurando contexto global de IA..."

# Garante que a pasta ai existe no dotfiles
if [ ! -d "$AI_DIR" ]; then
  echo "  Erro: diretório $AI_DIR não encontrado."
  echo "  Certifique-se de que CLAUDE.md e OPINIONS.md estão em ~/dotfiles/ai/"
  exit 1
fi

# Garante que os arquivos existem
for file in CLAUDE.md OPINIONS.md; do
  if [ ! -f "$AI_DIR/$file" ]; then
    echo "  Erro: $AI_DIR/$file não encontrado."
    exit 1
  fi
done

# Cria ~/.claude se não existir
mkdir -p "$CLAUDE_CONFIG_DIR"

# Cria symlink de CLAUDE.md global
CLAUDE_LINK="$CLAUDE_CONFIG_DIR/CLAUDE.md"

if [ -L "$CLAUDE_LINK" ]; then
  echo "  Symlink já existe: $CLAUDE_LINK → $(readlink "$CLAUDE_LINK")"
elif [ -f "$CLAUDE_LINK" ]; then
  echo "  Aviso: $CLAUDE_LINK já existe como arquivo comum, não como symlink."
  echo "  Faça backup e remova manualmente antes de rodar este script."
  exit 1
else
  ln -s "$AI_DIR/CLAUDE.md" "$CLAUDE_LINK"
  echo "  ✓ Symlink criado: $CLAUDE_LINK → $AI_DIR/CLAUDE.md"
fi

echo ""
echo "✓ Contexto global de IA configurado."
echo ""
echo "  Para verificar, abra uma sessão do Claude Code e rode:"
echo "  /context"
