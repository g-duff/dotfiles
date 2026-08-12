return {
	"scalameta/nvim-metals",
	ft = { "scala", "sbt", "java" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "scala", "sbt", "java" },
			group = group,
			callback = function()
				local metals = require("metals")
				local metals_config = metals.bare_config()
				metals_config.on_attach = require("g-duff.lsp").on_attach
				metals_config.settings.defaultBspToBuildTool = true
				metals.initialize_or_attach(metals_config)
			end,
		})
	end,
}
