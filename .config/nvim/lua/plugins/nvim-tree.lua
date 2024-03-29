return {
  'nvim-tree/nvim-tree.lua',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  opts = {
    actions = {
      open_file = {
        quit_on_open = true,

        window_picker = {
          chars = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        }
      },
    },

    trash = {
      cmd = 'trash',
    },

    view = {
      preserve_window_proportions = true,

      -- float = {
      --   enable = true,

      --   open_win_config = {
      --     relative = 'editor',
      --   }
      -- }
    },
  },

  config = function(_, opts)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup(opts)

    vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeToggle)
  end
}
