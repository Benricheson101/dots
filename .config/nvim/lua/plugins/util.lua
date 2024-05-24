local optutil = require('util.opt')

return {
  {
    'wakatime/vim-wakatime',
    event = {'BufReadPre', 'BufNewFile'},
  },
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    enabled = vim.fn.has('nvim-0.10.0') == 1,
  },
  {
    'tpope/vim-surround',
    event = {'BufReadPre', 'BufNewFile'},
  },
  {
    'adelarsq/vim-matchit',
    event = {'BufReadPre', 'BufNewFile'},
  },
  {
    'chaoren/vim-wordmotion',
    event = {'BufReadPre', 'BufNewFile'},
  },
  {
    'godlygeek/tabular',
    event = {'BufReadPre', 'BufNewFile'},
  },

  {
    'windwp/nvim-autopairs',
    event = {'InsertEnter'},

    opts = {
      check_ts = true,
    },

    config = function(_, opts)
      local autopairs = require('nvim-autopairs')
      autopairs.setup(opts)
      autopairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
      autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
      autopairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
    end
  },

  {
    'ntpeters/vim-better-whitespace',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
      -- FIXME: highlights red in insert mode after opening LSP floating hover
      -- TODO: rawr
      optutil.let_g {
        better_whitespace_guicolor = '#BF616A',
        current_line_whitespace_disabled_soft = 1,
      }
    end
  },

  {
    'mbbill/undotree',
    keys = {
      {'<leader>u', vim.cmd.UndotreeToggle, mode = 'n'},
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    main = 'ibl',
    opts = {
      scope = {enabled = false},
      indent = {
        -- char = '│',
        char = '¦',
      },
      whitespace = {},
      exclude = {
        filetypes = {
          '',
          'TelescopePrompt',
          'TelescopeResults',
          'checkhealth',
          'gitcommit',
          'help',
          'lspinfo',
          'man',
          'nofile',
          'nowrite',
          'packer',
          'prompt',
          'quickfix',
          'terminal',
        }
      }
    }
  },

  -- {
  --   'Yggdroot/indentLine',
  --   event = {'BufReadPre', 'BufNewFile'},
  --   config = function()
  --     optutil.let_g {
  --       indentLine_char = '¦',
  --       indentLine_setConceal = 0,
  --       indentLine_bufTypeExclude = {
  --         'help',
  --         'nofile',
  --         'nowrite',
  --         'quickfix',
  --         'terminal',
  --         'prompt',
  --       },
  --     }
  --   end
  -- },
}
