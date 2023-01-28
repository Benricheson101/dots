require('config.util.table')

local mason_lspconfig = require('mason-lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local mason = require('mason')

local custom_configs = {
  ['sumneko_lua'] = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
        },

        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },

        telemetry = {
          enable = false,
        },
      },
    },
  },
}

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    'eslint',
    'rust_analyzer',
    'sumneko_lua',
    'tsserver',
  }
}

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'go', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)

  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, float_opts)
    end
  })
end

mason_lspconfig.setup_handlers {
  function(name)
    local default_cfg = {
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    }
    local custom_cfg = custom_configs[name] or {}

    lspconfig[name].setup(MergeTable(default_cfg, custom_cfg))
  end
}
