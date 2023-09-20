local configs = require('nvim-treesitter.configs')

configs.setup {
  ensure_installed = {
    'c',
    'help',
    'javascript',
    'lua',
    'rust',
    'typescript',
    'vim',
  },

  indent = {
    enable = true,
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["as"] = "@scope",
      },
    },
  },
}
