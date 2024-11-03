-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
	debounce_text_changes = 150,
}

lspconfig = require('lspconfig')

lspconfig['pyright'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

lspconfig['tsserver'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}

lspconfig['rust_analyzer'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		}
	}
}

lspconfig['gopls'].setup{
	cmd = { vim.fn.expand("$GOBIN/gopls") },
	analyses = {
		unusedparams = true,
	},
	staticcheck = true,
	gofumpt = true,
	on_attach = on_attach,
}

lspconfig['terraformls'].setup{
	on_attach = on_attach,
}

vim.filetype.add({ extension = { ['cls'] = 'apex', }, })
lspconfig['apex_ls'].setup{
	-- Doc: https://developer.salesforce.com/docs/platform/sfvscode-extensions/guide/apex-language-server.html
	-- Download: https://github.com/forcedotcom/salesforcedx-vscode/blob/develop/packages/salesforcedx-vscode-apex/out/apex-jorje-lsp.jar
	-- I use: openjdk@17.0.12
	apex_jar_path = vim.fn.expand("$HOME/.local/share/nvim/apex-jorje-lsp.jar"),
	on_attach = on_attach,
	filetypes = { "apex" }
}
