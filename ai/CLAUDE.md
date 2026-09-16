# Contexto global

@OPINIONS.md

---

## Quem sou

Engenheiro de software pleno em uma startup de ~10 pessoas, com foco em Node.js. Estou construindo expertise profunda em sistemas distribuídos, infraestrutura e arquitetura de software com o objetivo de chegar ao nível principal/staff engineer.

---

## Como trabalho

- Prefiro respostas concretas e executáveis — comandos específicos, nomes de métricas, exemplos reais
- Trabalho de forma diretiva e incremental — proponha, execute, corrija, avance
- Trato projetos pessoais com o mesmo rigor de um produto real — decisões arquiteturais justificadas, ADRs, critérios de aceitação
- Tenho forte inclinação para automação — se algo pode ser automatizado, deve ser

---

## Ambiente de trabalho

**OS:** Windows 11  
**Terminal:** WezTerm (nightly) abrindo WSL automaticamente com tmux  
**Shell:** Bash via WSL (Ubuntu)  
**Editor:** Neovim com lazy.nvim

**Neovim**

- Gerenciador de plugins: lazy.nvim
- Plugins: Telescope, nvim-web-devicons, catppuccin
- Comandos customizados: `:EditConfig`, `:EditWezterm`, `:EditTmux`, `:EditBashrc`
- Atalho: `Ctrl+P` para busca de arquivos

**tmux**

- Prefixo: `Ctrl+A`
- `Alt+|` — divide verticalmente
- `Alt+-` — divide horizontalmente
- `Alt+seta` — navega entre painéis

**Dotfiles**

- Repositório: `github.com/vcastro-dev/dotfiles`
- Localização no Windows: `D:\Workspace\pessoal\dotfiles\`
- Versionado com git, publicado via `gh`

**Estrutura de arquivos**

| Arquivo                    | Descrição                            |
| -------------------------- | ------------------------------------ |
| `ai/CLAUDE.md`             | Contexto global de IA (este arquivo) |
| `ai/OPINIONS.md`           | Opiniões técnicas                    |
| `ai/script/install-ai.sh`  | Instalação do contexto global de IA  |
| `config/script/install.sh` | Instalação de symlinks gerais        |
| `config/.bashrc_custom`    | Customizações do bash                |
| `config/.gitattributes`    | Configuração do git                  |
| `config/.tmux.conf`        | Configuração do tmux                 |
| `config/.wezterm.lua`      | Configuração do WezTerm              |
| `config/init.lua`          | Configuração do Neovim               |

**Symlinks ativos**

- `C:\Users\victo\.wezterm.lua` → `D:\Workspace\pessoal\dotfiles\.wezterm.lua`
- `~/.config/nvim/init.lua` → `dotfiles/init.lua` (WSL)
- `~/.tmux.conf` → `dotfiles/.tmux.conf` (WSL)
- `~/.bashrc` faz source de `dotfiles/.bashrc_custom`
- `~/.claude/CLAUDE.md` → `dotfiles/ai/CLAUDE.md` (WSL)
