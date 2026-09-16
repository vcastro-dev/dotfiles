local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
  mux.spawn_window(cmd or {})

  -- Lê DOTFILES_WSL do ~/.dotfiles.env
  local env = io.open(os.getenv("USERPROFILE") .. "\\.dotfiles.env", "r")
  if not env then return end

  for line in env:lines() do
    local path = line:match('^DOTFILES_WIN="?([^"]+)"?')
    if path then
      env:close()
      local drive, rest = path:match("^(%a):\\(.*)")
      local wsl_path = "/mnt/" .. drive:lower() .. "/" .. rest:gsub("\\", "/")
      wezterm.run_child_process({
        "wsl.exe", "bash", "-c",
        "bash " .. wsl_path .. "/config/script/install.sh &>/tmp/dotfiles-install.log &"
      })
      return
    end
  end
  env:close()
end)

return {
  default_prog = { 'wsl.exe', 'bash', '-i', '-l' },
  color_scheme              = 'Catppuccin Mocha',
  window_background_opacity = 0.95,
  window_padding            = { left = 12, right = 12, top = 12, bottom = 12 },
  hide_tab_bar_if_only_one_tab = false,
  window_decorations        = "INTEGRATED_BUTTONS|RESIZE",
  window_close_confirmation = "NeverPrompt",
  use_fancy_tab_bar         = false,
  tab_bar_at_bottom         = true,
}