vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<cr>')

-- buffer
vim.keymap.set("n", "<leader>b", ":b ", { desc = "Switch buffer with leader key" })
-- here it pressing <leader>b will write `:b ` which takes me
-- to command line with :b already written. So i only have to
-- mention which buffer to go and press enter
vim.keymap.set("n", "<leader>ls", "<cmd>ls<cr>", { desc = "Listing out buffers" })

-- window
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = "Move focus to left window" })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = "Move focus to below window" })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = "Move focus to above window" })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = "Move focus to right window" })


vim.keymap.set('n', '-', '<cmd>Oil --float<cr>', { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>ta', '<cmd>!terminator &<cr>', { desc = "Opens new terminal with same pwd" })
