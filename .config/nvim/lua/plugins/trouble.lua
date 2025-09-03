return {
  'folke/trouble.nvim',
  -- opts = {
  --   modes = {
  --     preview_float = {
  --       mode = "diagnostics",
  --       win = {position = 'right'},
  --       preview = {
  --         type = "float",
  --         relative = "editor",
  --         border = "rounded",
  --         title = "Preview",
  --         title_pos = "center",
  --         position = { 0, -2 },
  --         size = { width = 0.3, height = 0.3 },
  --         zindex = 200,
  --       },
  --     },
  --   },
  -- },
  cmd = 'Trouble',
  keys = {
    {'<leader>tt', function() require('trouble').toggle('diagnostics') end},
    -- {'<leader>tw', function() require('trouble').toggle('workspace_diagnostics') end},
    -- {'<leader>td', function() require('trouble').toggle('document_diagnostics') end},
    {'<leader>tq', function() require('trouble').toggle('quickfix') end},
    {'<leader>tl', function() require('trouble').toggle('loclist') end},
    {'<leader>ts', function() require('trouble').toggle('lsp_document_symbols') end},
  },
}
