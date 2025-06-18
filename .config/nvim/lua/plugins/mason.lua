return {
  {
    'mason-org/mason.nvim',
    tag = "v1.11.0",
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
  },
  {
    'mason-org/mason-lspconfig.nvim',
    tag = 'v1.32.0',
  }
}
