local tableutil = require('util.table')

local mason_lspconfig = require('mason-lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local schemastore = require('schemastore')

local custom_configs = {
  rust_analyzer = {
    flags = {
      exit_timeout = 0,
    },

    settings = {
      rust = {
      },
    },
  },

  sumneko_lua = {
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

  jsonls = {
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = {
          enable = true,
        },
      },
    },
  },

  elixirls = {
    cmd = {
      vim.fn.expand('~/.local/src/elixir-ls/release/language_server.sh'),
    },

    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
      },
    },
  },

  -- gleam = {
  --   cmd = {'gleam', 'lsp'},

  --   filetypes = {'gleam'},

  --   root_dir = lspconfig.util.root_pattern('gleam.toml'),

  --   settings = {
  --     gleam = {
  --     },
  --   },
  -- },
}

-- mason_lspconfig.setup {
--   -- ensure_installed = {
--   --   'eslint',
--   --   'rust_analyzer',
--   --   -- 'sumneko_lua',
--   --   'tsserver',
--   -- }
-- }

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

  -- only reopen floating diagnostic window once the cursor moves. this prevents the
  -- floating diagnostic window from covering other floating windows (like hover)
  local group = vim.api.nvim_create_augroup('LSPDiagnosticOnHover', { clear = true })
  vim.api.nvim_create_autocmd('CursorHold', {
    buffer = bufnr,
    group = group,
    callback = function()
      local current_cursor_pos = vim.api.nvim_win_get_cursor(0)
      local last_popup_cursor_pos = vim.w.lsp_diagnostics_last_cursor or {nil, nil}

      if current_cursor_pos[1] ~= last_popup_cursor_pos[1] or current_cursor_pos[2] ~= last_popup_cursor_pos[2] then
        vim.w.lsp_diagnostics_last_cursor = current_cursor_pos

        local float_opts = {
          focusable = false,
          close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }

        --TODO: set some key to close floating window?
        vim.diagnostic.open_float(nil, float_opts)
      end
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

    lspconfig[name].setup(tableutil.merge_table(default_cfg, custom_cfg))
  end
}

local lspconfig = require('lspconfig')

local gleam = {
  cmd = {'gleam', 'lsp'},

  filetypes = {'gleam'},

  root_dir = lspconfig.util.root_pattern('gleam.toml'),

  settings = {
    gleam = {
    },
  },
}

lspconfig.gleam.setup {
  cmd = {'gleam', 'lsp'},

  filetypes = {'gleam'},

  root_dir = lspconfig.util.root_pattern('gleam.toml'),

  settings = {
    gleam = {
    },
  }
}
