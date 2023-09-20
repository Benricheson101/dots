local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup {
  ui = {
    border = 'rounded',

    -- keymaps = {},
  }
}

mason_lspconfig.setup {}

vim.keymap.set('n', '<C-m>', vim.cmd.Mason)
vim.keymap.del('n', '<CR>')
