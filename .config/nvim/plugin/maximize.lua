local LAST_SIZE_VAR = 'maximize_last_win_size'
local IS_MAXIMIZED_VAR = 'maximize_is_maximized'

local M = {}

--- Maximize a window. This works by setting the window size to $COLUMNS x $ROWS, shrinking the other windows.
---
--- For purposes of restoring, a window variable is set on each window of the tabpage containing the height and width before maximizing.
--- @param win number? the window id to maximize
function M.maximize(win)
  local winutil = require('util.win')

  if not win then
    win = 0
  end

  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins == 1 then
    return
  end

  vim.api.nvim_tabpage_set_var(0, IS_MAXIMIZED_VAR, true)

  for w, win_config in winutil.windows() do
    vim.api.nvim_win_set_var(
      w,
      LAST_SIZE_VAR,
      {
        height = win_config.height,
        width = win_config.width,
      }
    )
  end

  vim.api.nvim_win_set_width(win, vim.go.columns)
  vim.api.nvim_win_set_height(win, vim.go.lines)
end

--- Restores the split windows sizes to what they were before maximizing
function M.restore()
  local winutil = require('util.win')

  if not vim.t[IS_MAXIMIZED_VAR] then
    return
  end

  vim.api.nvim_tabpage_del_var(0, IS_MAXIMIZED_VAR)

  for win in winutil.windows() do
    local ok, last_size = pcall(vim.api.nvim_win_get_var, win, LAST_SIZE_VAR)

    if ok and last_size then
      vim.api.nvim_win_del_var(win, LAST_SIZE_VAR)
      vim.api.nvim_win_set_width(win, last_size.width)
      vim.api.nvim_win_set_height(win, last_size.height)
    end
  end
end

--- Toggles maximize and restore
function M.toggle()
  if vim.t[IS_MAXIMIZED_VAR] then
    M.restore()
  else
    M.maximize()
  end
end

vim.keymap.set({'n', 'v'}, '<leader>z', M.toggle)

return M
