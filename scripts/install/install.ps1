$DOTFILES = Split-Path -Parent $MyInvocation.MyCommand.Path
New-Item -ItemType SymbolicLink -Force -Path "$env:USERPROFILE\.wezterm.lua" -Target "$DOTFILES\.wezterm.lua"