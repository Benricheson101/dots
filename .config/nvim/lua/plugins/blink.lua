local ts = require "util.ts"
return {
  'saghen/blink.cmp',

  dependencies = {
    'rafamadriz/friendly-snippets',
    'honza/vim-snippets',
  },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = false, -- adds () when completing an import in js lol
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          max_height = 20,
        },
      },

      ghost_text = {
        enabled = false,
        show_without_menu = false,
      },

      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },

      menu = {
        auto_show = function ()
          local node = ts.get_node_under_cursor()
          if node == nil then
            return true
          end

          local disable_in = {'comment', 'comment_content'}
          return not vim.tbl_contains(disable_in, node:type())
        end
      },

      trigger = {
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
        show_on_blocked_trigger_characters = {'\t'},
        show_on_x_blocked_trigger_characters = {'\t'},
        -- show_on_blocked_trigger_characters = {' ', '\n'},
      }
    },

    cmdline = {
      enabled = false,
    },

    keymap = {
      ['<C-Space>'] = {'show'},
      ['<CR>'] = {'accept', 'fallback'},
      ['<Tab>'] = {'select_next', 'fallback'},
      ['<S-Tab>'] = {'select_prev', 'fallback'},
      ['<C-k>'] = {'scroll_documentation_up', 'snippet_backward'},
      ['<C-j>'] = {'scroll_documentation_down', 'snippet_forward'},
      ['<C-c>'] = {'hide', 'fallback'},
    },

    signature = {
      enabled = false,
      window = {
        show_documentation = false,
      },
    },

    sources = {
      default = function ()
        local node = ts.get_node_under_cursor()

        if node and vim.tbl_contains({'string', 'string_content'}, node:type()) then
          return {'path'}
        else
          return {'lsp', 'path', 'snippets'}
        end
      end,

      providers = {
        snippets = {
          enabled = false,
          should_show_items = function (ctx)
            return ctx.trigger.initial_kind ~= 'trigger_character'
          end
        },
      },
    },
  },
}
