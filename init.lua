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

-- Oil Nvim
require("config.oil")

-- keymaps
require("keymap")

--[[
vim.keymap.set('n', '<leader>st', '<cmd>terminal<cr>', { desc = "Terminal session inside neovim" })

local function switch_to_tab()
  -- Capture user input (a single number)
  local number = vim.fn.getcharstr()
  if tonumber(number) then
    -- Switch to the specified tab
    vim.cmd("tabnext " .. number)
  else
    print("Invalid input: not a number")
  end
end

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  callback = function()
    local buffnr = vim.api.nvim_get_current_buf()
    -- vim.keymap.set('t', '<C-n>', [[<C-\><C-n>\]\], { desc = "Exit terminal mode", buffer = buffnr })
    vim.keymap.set('t', '<C-s>', switch_to_tab, { desc = "Switch tabs in terminal mode", buffer = buffnr })
  end
})
]] --

-- printing tables
-- vim.print(require("cmp_nvim_lsp").default_capabilities())
