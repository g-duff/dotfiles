local oil = require("oil")

oil.setup()

vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>fl", oil.open_float, { desc = "Open floating parent directory" })

