local wezterm = require 'wezterm'
wezterm.log_info("default_prog configurado")
return {
  default_prog = { 'C:\\Program Files\\Git\\usr\\bin\\bash.exe', '--login', '-i' },
}
