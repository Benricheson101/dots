local M = {}

---Iterator over windows in a tabpage
---@param tabpage number? which tabpage to iterate over (0 for current) *default: 0*
---@param skip_floating boolean? whether or not to skip floating windows
---@return function
function M.windows(tabpage, skip_floating)
  if not tabpage then
    tabpage = 0
  end

  if skip_floating == nil then
    skip_floating = true
  end

  local wins = vim.api.nvim_tabpage_list_wins(tabpage)
  local i = 0

  local function next()
    i = i + 1

    if i <= #wins then
      local win_config = vim.api.nvim_win_get_config(wins[i])

      if
        (skip_floating and win_config.relative ~= '')
        or win_config.external -- what does this do?
      then
        return next()
      end

      return wins[i], win_config
    else
      return nil
    end
  end

  return next
end

return M
