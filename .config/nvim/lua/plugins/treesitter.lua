return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = {'BufReadPre', 'BufNewFile'},
    branch = 'main',
    dependencies = {
      -- 'RRethy/nvim-treesitter-endwise',
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
      'IndianBoy42/tree-sitter-just',
      -- 'hrsh7th/nvim-cmp',

      {
        "folke/ts-comments.nvim",
        opts = {},
        -- event = "VeryLazy",
        -- enabled = vim.fn.has("nvim-0.10.0") == 1,
      },
    },

    build = function()
      local install =  require('nvim-treesitter.install')
      install.compilers = {'gcc', 'clang'}
      install.update {with_sync = true}
    end,

    opts = function()
      return {
        ensure_installed = {
          'c',
          -- 'help',
          'javascript',
          'lua',
          'rust',
          'typescript',
          'vim',
        },

        indent = {
          enable = true,
          disable = {'yaml'}
        },

        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        -- endwise = {
        --   enable = true,
        -- },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<tab>',
            node_decremental = '<s-tab>',
          },
        },

        -- textobjects = {
        --   select = {
        --     enable = true,
        --     lookahead = true,
        --
        --     keymaps = {
        --       ["af"] = "@function.outer",
        --       ["if"] = "@function.inner",
        --       ["ac"] = "@class.outer",
        --       ["ic"] = "@class.inner",
        --       ["as"] = "@scope",
        --     },
        --   },
        --
        --   swap = {
        --     enable = true,
        --     swap_next = {
        --       ['<leader>a'] = '@parameter.inner',
        --     },
        --     swap_previous = {
        --       ['<leader>A'] = '@parameter.inner',
        --     },
        --   },
        --
        --   -- lsp_interop = {
        --   --   enable = true,
        --   --   floating_preview_opts = require('cmp').config.window.bordered(),
        --   --   peek_definition_code = {
        --   --     ['<leader>df'] = '@function.outer',
        --   --     ['<leader>dF'] = '@class.outer',
        --   --   },
        --   -- },
        -- },
      }
    end,

    config = function(_, opts)
      -- local configs = require('nvim-treesitter.configs')
      -- configs.setup(opts)

      -- require('tree-sitter-just').setup({})
      -- require('nvim-treesitter.parsers').get_parser_configs().just.install_info.use_makefile = true
      -- local ts = require('nvim-treesitter')
      -- ts.setup {
      --
      -- }
      local parsersInstalled = require('nvim-treesitter.config').get_installed('parsers')
      for _, parser in pairs(parsersInstalled) do
        local filetypes = vim.treesitter.language.get_filetypes(parser)
        vim.api.nvim_create_autocmd({"FileType"}, {
          pattern = filetypes,
          callback = function(d)
            local bufnr = d.buf

            vim.treesitter.start()
            vim.bo[bufnr].syntax = 'on'
            vim.wo.foldlevel = 99
            vim.wo.foldmethod = 'expr'
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.bo[bufnr].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
          end,
        })
      end
    end
  },
}
