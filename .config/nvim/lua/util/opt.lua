local tableutil = require('util.table')

local M = {}

local function table_set(into)
  return function(opts)
    tableutil.merge_table(into, opts)
  end
end

M.set = table_set(vim.opt)
M.let_g = table_set(vim.g)
M.g = table_set(vim.g)

return M
