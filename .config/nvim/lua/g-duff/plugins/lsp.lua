local lsp = require("g-duff.lsp")

local lsp_flags = {
	debounce_text_changes = 150,
}

local function setup_server(name, config)
	config.on_attach = lsp.on_attach
	config.flags = lsp_flags
	vim.lsp.config(name, config)
	vim.lsp.enable(name)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { silent = true, desc = "Show diagnostic" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true, desc = "Previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true, desc = "Next diagnostic" })
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { silent = true, desc = "Diagnostics list" })

		setup_server("pyright", {})
		setup_server("ts_ls", {})
		setup_server("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					check = { command = "clippy" },
				},
			},
		})
		setup_server("gopls", {
			cmd = { vim.fn.expand("$GOBIN/gopls") },
			settings = {
				gopls = {
					analyses = { unusedparams = true },
					staticcheck = true,
					gofumpt = true,
				},
			},
		})
		setup_server("terraformls", {})
	end,
}
