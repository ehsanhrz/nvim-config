vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", {
  noremap = true, -- Avoids creating a new mapping in insert mode
  silent = true,  -- Prevents unnecessary echo in the command line
})

