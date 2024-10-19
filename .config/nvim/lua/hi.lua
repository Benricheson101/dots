local hl = require('util.hl')

for _, type in ipairs {'Ok', 'Info', 'Hint', 'Warn', 'Error'} do
  hl.extend('DiagnosticUnderline' .. type, {undercurl = true})
end
