local mason = require('mason')

mason.setup {
  ui = {
    border = 'rounded'
  }
}

vim.keymap.set('n', '<C-m>', vim.cmd.Mason)
