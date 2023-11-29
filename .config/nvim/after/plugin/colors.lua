-- require('ayu').setup({
--   mirage = true
-- })

-- vim.cmd.colors('ayu')

vim.cmd.colors('habamax')

-- sets the floating window border to match the background (making it ""invisible"")
vim.api.nvim_set_hl(0, 'FloatBorder', {link = 'Normal'})
vim.api.nvim_set_hl(0, 'Pmenu', {link = 'Normal'})
