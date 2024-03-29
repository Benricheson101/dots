return  {
  'williamboman/mason.nvim',
  opts = {
    ui = {
      border = 'rounded',
    },
  },

  keys = {
    {'<C-m>', vim.cmd.Mason, mode = 'n'},
  },

  config = function(_, opts)
    require('mason').setup(opts)
    vim.keymap.del('n', '<CR>')
  end
}
