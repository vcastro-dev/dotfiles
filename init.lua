-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
	{ "nvim-telescope/telescope.nvim",dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-tree/nvim-web-devicons" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})

-- Theme
vim.cmd.colorscheme("catppuccin")

-- Preference
vim.opt.number = true
vim.opt.relativenumber = true

-- Command
local dotfiles = os.getenv("HOME") .. "/dotfiles"

vim.api.nvim_create_user_command('EditConfig', function()
  vim.cmd('edit ' .. dotfiles .. '/init.lua')
end, {})

vim.api.nvim_create_user_command('EditWezterm', function()
  vim.cmd('edit ' .. dotfiles .. '/.wezterm.lua')
end, {})

vim.api.nvim_create_user_command('EditTmux', function()
  vim.cmd('edit ' .. dotfiles .. '/.tmux.conf')
end, {})

vim.api.nvim_create_user_command('EditBashrc', function()
  vim.cmd('edit ' .. dotfiles .. '/.bashrc_custom')
end, {})

-- Atalho
vim.keymap.set('n', '<C-p>', function()
  require('telescope.builtin').find_files()
end)

