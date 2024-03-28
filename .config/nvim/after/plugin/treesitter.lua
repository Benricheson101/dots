local configs = require('nvim-treesitter.configs')

require('nvim-treesitter.install').compilers = {'gcc', 'clang'}

require('tree-sitter-just').setup({})
require('nvim-treesitter.parsers').get_parser_configs().just.install_info.use_makefile = true

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

  endwise = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<tab>',
      node_decremental = '<s-tab>',
    },
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
