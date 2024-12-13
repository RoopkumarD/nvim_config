vim.o.number = true
vim.o.relativenumber = true
vim.o.textwidth = 100
vim.o.shiftwidth = 4

vim.o.wrap = false

vim.o.clipboard = 'unnamedplus'

-- default = "jtcroql"
vim.o.formatoptions = "jtcroql"
-- format settings for vim internal formatting tool
-- refer help formatoptions and for removing comment leader
-- press CTRL_U as suggested in help

-- lazy package manager
require("config.lazy")

-- keymaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = "Move focus to left window" })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = "Move focus to below window" })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = "Move focus to above window" })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = "Move focus to right window" })

vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<cr>')

vim.keymap.set('n', '<leader>ta', '<cmd>!terminator &<cr>', { desc = "Opens new terminal with same pwd" })
