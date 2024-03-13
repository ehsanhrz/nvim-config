local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-x>", mark.add_file)
vim.keymap.set("n", "<C-c>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-b>", function() ui.nav_file(2) end)
