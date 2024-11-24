local M = {}

--- Copies all of `from`'s values into `into`, and returns it
--- @param into table the starting table
--- @param from table the table with the properties to copy
--- @return table merged the merged tables
function M.merge_table(into, from)
  for k, v in pairs(from) do
    if type(v) == 'function' then
      v(into, from, k)
    else
      into[k] = v
    end
  end

  return into
end

--- Merges two lua-lists and returns the result (non-mutating)
--- @param a table
--- @param b table
--- @return table merged the merged values
function M.cat(a, b)
  return vim.iter({a, b}):flatten(1):totable()
end

--- For use with M.merge_table, this function is a convenient way of calling tbl:append() on objects in vim.opt
function M.append(v)
  return function (into, _, k)
    local ty = type(v)

    if ty == 'table' then
      for _, val in ipairs(v) do
        into[k]:append(val)
      end
    elseif ty ~= 'nil' then
      into[k]:append(v)
    end
  end
end

--- For use with M.merge_table, this function is a convenient way of calling tbl:remove() on objects in vim.opt
function M.remove(v)
  return function (into, _, k)
    local ty = type(v)

    if ty == 'table' then
      for _, val in ipairs(v) do
        into[k]:remove(val)
      end
    elseif ty ~= 'nil' then
      into[k]:remove(v)
    end
  end
end

--- Similar to M.append and M.remove, this combines the two into (append, remove) so items can be added and removed in one call
function M.append_remove(a, r)
  return function (...)
    M.append(a)(...)
    M.remove(r)(...)
  end
end

return M
