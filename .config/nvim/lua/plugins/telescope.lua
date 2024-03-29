return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },

  opts = {
    defaults = {
      file_ignore_patterns = {
        "^.git/",
        "^build/",
        "deps",
        "dist",
        "node_modules",
        "target",
        "vendor/",
        "^.svelte-kit/"
      }
    },

    extensions = {
      file_browser = {},

      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },

    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },

  keys = {
    '<leader>pc',
    '<leader>pf',
    '<leader>gf',
    '<C-F>',
    '<CS-f>',
  },

  config = function(plg, opts)
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup(opts)

    telescope.load_extension('file_browser')
    telescope.load_extension('fzf')

    vim.keymap.set('n', '<leader>pc', telescope.extensions.file_browser.file_browser)
    vim.keymap.set('n', '<leader>pf', builtin.find_files)
    vim.keymap.set('n', '<leader>gf', builtin.git_files)
    vim.keymap.set('n', '<C-F>', builtin.live_grep)
    vim.keymap.set('n', '<CS-f>', builtin.live_grep)
  end
}
