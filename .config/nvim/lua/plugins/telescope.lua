return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'jvgrootveld/telescope-zoxide',
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
      },
    },

    extensions = {
      file_browser = {
        git_status = false,
      },

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

    zoxide = {
      -- mappings = {
      --   ['<leader>pz'] = {
      --     keepinsert = true,
      --     action = function (selection)
      --       require("telescope").extensions.file_browser.file_browser({ cwd = selection.path })
      --     end
      --   }
      -- },
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
    telescope.load_extension('zoxide')

    vim.keymap.set('n', '<leader>pc', telescope.extensions.file_browser.file_browser)
    vim.keymap.set('n', '<leader>pf', builtin.find_files)
    vim.keymap.set('n', '<leader>gf', builtin.git_files)
    vim.keymap.set('n', '<C-F>', builtin.live_grep)
    vim.keymap.set('n', '<CS-f>', builtin.live_grep)

    -- from: https://github.com/nvim-telescope/telescope.nvim/issues/3436
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TelescopeFindPre',
      callback = function()
        vim.opt_local.winborder = 'none'
        vim.api.nvim_create_autocmd('WinLeave', {
          once = true,
          callback = function()
            vim.opt_local.winborder = 'rounded'
          end,
        })
      end,
    })
  end
}
