vim.g.mapleader = " "

vim.keymap.set("n", "<leader>le", vim.cmd.Ex) -- look explorer

-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d') -- delete motion
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor

-- Window navigation
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wl', '<C-w>l')

vim.keymap.set('n', '<leader>w<Left>', '<C-w>h')
vim.keymap.set('n', '<leader>w<Down>', '<C-w>j')
vim.keymap.set('n', '<leader>w<Up>', '<C-w>k')
vim.keymap.set('n', '<leader>w<Right>', '<C-w>l')

-- Tab navigation
vim.keymap.set('n', '<leader>th', vim.cmd.tabprev)
vim.keymap.set('n', '<leader>tl', vim.cmd.tabnext)

vim.keymap.set('n', '<leader>t<Left>', vim.cmd.tabprev)
vim.keymap.set('n', '<leader>t<Right>', vim.cmd.tabnext)

