local M = {}

function M.get_node_under_cursor()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- TODO: does the col-1 change based on normal vs insert mode?
  local _, ts_node = pcall(
    vim.treesitter.get_node,
    {
      pos = {row - 1, math.max(0, col - 1)},
      include_anonymous = false,
      ignore_injections = true,
    }
  )

  return ts_node
end

-- function M.get_parents_under_cursor()
--   local row, col = unpack(vim.api.nvim_win_get_cursor(0))
--
--   -- TODO: does the col-1 change based on normal vs insert mode?
--   local _, ts_node = pcall(
--     vim.treesitter.get_node,
--     {
--       pos = {row - 1, math.max(0, col - 1)},
--       include_anonymous = false,
--       ignore_injections = false,
--     }
--   )
--
--   return ts_node
-- end

return M
