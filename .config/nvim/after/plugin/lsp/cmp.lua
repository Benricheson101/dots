local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
  formatting = {
    format = function(_, vim_item)
      vim_item.menu = string.sub(vim_item.menu or '', 1, 50)
      return vim_item
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- scroll docs down by 4 lines
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    -- scroll docs up by 4 lines
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    -- open the completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    -- choose completion
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- move down the completion list
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- move backwards up the completion list
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
