local M = {}

function M.on_attach(_, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	local opts = { buffer = bufnr, silent = true }
	local mappings = {
		{ "n", "gd", vim.lsp.buf.definition, "Go to definition" },
		{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
		{ "n", "gr", vim.lsp.buf.references, "Find references" },
		{ "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
		{ "n", "K", vim.lsp.buf.hover, "Show hover information" },
		{ "n", "<C-k>", vim.lsp.buf.signature_help, "Show signature help" },
		{ "n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
		{ "n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
		{
			"n",
			"<space>wl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List workspace folders",
		},
		{ "n", "<space>D", vim.lsp.buf.type_definition, "Go to type definition" },
		{ "n", "<space>rn", vim.lsp.buf.rename, "Rename symbol" },
		{ "n", "<space>ca", vim.lsp.buf.code_action, "Code action" },
		{
			"n",
			"<space>f",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Format buffer",
		},
	}

	for _, mapping in ipairs(mappings) do
		vim.keymap.set(mapping[1], mapping[2], mapping[3], vim.tbl_extend("force", opts, {
			desc = mapping[4],
		}))
	end
end

return M
