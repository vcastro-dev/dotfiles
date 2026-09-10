local wezterm = require 'wezterm'

return {
	default_prog = { 'C:\\Program Files\\Git\\usr\\bin\\bash.exe', '--login', '-i' },
	color_scheme = 'Catppuccin Mocha',
	window_background_opacity = 0.95,
	window_padding = { left = 12, right = 12, top = 12, bottom = 12 },
	hide_tab_bar_if_only_one_tab = false,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_close_confirmation = "NeverPrompt",
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
}
