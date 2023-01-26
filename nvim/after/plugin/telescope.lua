local builtin = require('telescope.builtin')

-- Project files
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})

-- Project all (files)
vim.keymap.set('n', '<leader>pa', builtin.find_files, {})

-- Project buffers
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

-- Project grep
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})

