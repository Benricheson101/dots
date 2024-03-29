return {
  'hrsh7th/nvim-cmp',
  event = {'InsertEnter'},
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',

    {
      'L3MON4D3/LuaSnip',
      build = 'make install_jsregexp',
      dependencies = {
        'rafamadriz/friendly-snippets',
        'honza/vim-snippets',
      },
    },
  },

  config = function()
    local cmp = require('cmp')
    local cmp_types = require('cmp.types')
    local cmp_context = require('cmp.config.context')

    local luasnip = require('luasnip')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    luasnip.config.setup {
      store_selection_keys = '<TAB>'
    }

    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_snipmate').lazy_load()

    cmp.setup {
      enable = function ()
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not cmp_context.in_treesitter_capture("comment")
            and not cmp_context.in_syntax_group("Comment")
        end
      end,

      formatting = {
        format = function(_, vim_item)
          vim_item.menu = string.sub(vim_item.menu or '', 1, 50)
          return vim_item
        end
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(), -- TODO: how do I make this wider?
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        -- open the completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- choose completion
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },

        -- move down the completion list
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),

        -- move backwards up the completion list
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-j>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.scroll_docs(4)
          elseif luasnip.in_snippet() and luasnip.jumpable(1) then
            luasnip.jump(1)
          end
        end, {'i', 's'}),

        ['<C-k>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.scroll_docs(-4)
          elseif luasnip.in_snippet() and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          end
        end, {'i', 's'}),

        ['<c-c>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()
          else
            fallback()
          end
        end)
      }),

      sources = {
        {
          name = 'nvim_lsp',
          entry_filter = function (entry)
            local kind = cmp_types.lsp.CompletionItemKind[entry:get_kind()]
            return kind ~= "Text"
          end
        },
        {name = 'luasnip', options = {use_show_conditions = false}},
        {name = 'path'},
      },
    }

    -- cmp.event:on(
    --   'confirm_done',
    --   cmp_autopairs.on_confirm_done()
    -- )
  end
}
