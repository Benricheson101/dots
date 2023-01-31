require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c',
    'help',
    'javascript',
    'lua',
    'rust',
    'typescript',
    'vim',
  },

  tree_docs = {
    enable = true,
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
