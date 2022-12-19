local builtin = require('telescope.builtin')

-- Find files
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})

-- Find all
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})

