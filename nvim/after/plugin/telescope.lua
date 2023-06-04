local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>la', builtin.find_files, {}) -- look all (files)
vim.keymap.set('n', '<leader>lb', builtin.buffers, {}) -- look buffers
vim.keymap.set('n', '<leader>lf', builtin.git_files, {}) -- look files (git)
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {}) -- look grep
vim.keymap.set('n', '<leader>lh', builtin.help_tags, {}) -- look help
