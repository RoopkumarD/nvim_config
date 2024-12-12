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
