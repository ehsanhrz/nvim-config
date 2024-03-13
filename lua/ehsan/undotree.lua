local utree = require("undotree")
vim.keymap.set('n', '<leader>u', utree.toggle, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>uo', utree.open, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>uc', utree.close, { noremap = true, silent = true })
