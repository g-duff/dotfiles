return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>la", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>lb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>lf", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
		{ "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>lh", "<cmd>Telescope help_tags<cr>", desc = "Search help" },
	},
}
