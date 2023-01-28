local function table_set(into)
  return function(opts)
    for opt, val in pairs(opts) do
      into[opt] = val
    end
  end
end

set = table_set(vim.opt)
let_g = table_set(vim.g)
