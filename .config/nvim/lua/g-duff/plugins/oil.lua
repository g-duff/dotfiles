return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		{ "<leader>fl", "<cmd>Oil --float<cr>", desc = "Open floating parent directory" },
	},
}
