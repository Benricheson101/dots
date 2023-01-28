--- Copies all of `from`'s values into `into`, and returns it
--- @param into table the starting table
--- @param from table the table with the properties to copy
--- @return table the merged tables
function MergeTable(into, from)
  for k, v in pairs(from) do
    into[k] = v
  end

  return into
end
