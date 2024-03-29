return {
  'folke/trouble.nvim',
  keys = {
    {'<leader>tt', function() require('trouble').toggle() end},
    {'<leader>tw', function() require('trouble').toggle('workspace_diagnostics') end},
    {'<leader>td', function() require('trouble').toggle('document_diagnostics') end},
    {'<leader>tq', function() require('trouble').toggle('quickfix') end},
    {'<leader>tl', function() require('trouble').toggle('loclist') end},
  }
}
