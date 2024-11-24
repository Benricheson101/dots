local hl = require('util.hl')

for _, type in ipairs {'Ok', 'Info', 'Hint', 'Warn', 'Error'} do
  hl.extend('DiagnosticUnderline' .. type, {undercurl = true})
end

-- sets the floating window border to match the background (making it ""invisible"")
vim.api.nvim_set_hl(0, 'FloatBorder', {link = 'Normal'})
vim.api.nvim_set_hl(0, 'Pmenu', {link = 'Normal'})
