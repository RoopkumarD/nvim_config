-- todo:
-- setting each terminal assigned to each file buffer

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local create_centered_floating_window = function(opts)
  -- Determine the editor size
  local editor_width = vim.o.columns
  local editor_height = vim.o.lines

  -- Default size of the floating window
  local width = math.floor(editor_width * 0.7)   -- 50% of the editor width
  local height = math.floor(editor_height * 0.8) -- 40% of the editor height
  local adjuster = 1                             -- Adjust window little

  -- Center the window
  local col = math.floor((editor_width - width) / 2) - adjuster
  local row = math.floor((editor_height - height) / 2) - adjuster

  local buf = opts.buf
  if not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
  end

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    border = { "/", "-", "\\", "|" },
  })

  return { buf = buf, win = win }
end

-- Call the function to create the floating window
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = "Escape terminal edit mode" })

vim.api.nvim_create_user_command(
  "FloatingTerm",
  function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
      state.floating = create_centered_floating_window({ buf = state.floating.buf })
      if vim.bo[state.floating.buf].buftype ~= "terminal" then
        vim.cmd.terminal()
      end
    else
      vim.api.nvim_win_hide(state.floating.win)
    end
  end,
  {})

vim.keymap.set({ 'n', 't' }, '<leader>ft', "<cmd>FloatingTerm<cr>", { desc = "Opens floating terminal" })
