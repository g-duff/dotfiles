return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}
