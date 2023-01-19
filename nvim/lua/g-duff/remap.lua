vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Replace selected word and preserve register
vim.keymap.set("x", "<leader>p", "\"_dP")

