local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neovim/nvim-lspconfig",
	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
	},
	{
		"nvim-telescope/telescope.nvim", 
		version = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
},
{
	dev = {
		-- directory where you store your local plugin projects
		path = '~/dev',
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {'g-duff'}, -- For example {'folke'}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
})

