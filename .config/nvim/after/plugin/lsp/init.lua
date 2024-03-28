local mason_lspconfig = require('mason-lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local schemastore = require('schemastore')
local lspconfig = require('lspconfig')

local lsp_attach

require('neodev').setup {
  library = {
    enabled = true,
    runtime = true,
    types = true,
    plugins = false,
  }
}

local custom_configs = {
  biome = {
    -- cmd = {'biome', 'lsp-proxy'},
    root_dir = lspconfig.util.root_pattern('biome.json'),
    filetypes = {
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'typescript',
      'typescript.tsx',
      'typescriptreact'
    },
  },

  rust_analyzer = {
    flags = {
      exit_timeout = 0,
    },

    settings = {
      rust = {
      },
    },
  },

  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
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

  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          -- shows the value of an enum member in its declaration
          includeInlayEnumMemberValueHints = true,
          -- shows the inferred return type of a function
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayFunctionParameterTypeHints = true,
          -- parameters in function calls
          includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
          -- shows the parameter name in a function when both the parameter name and input variable name are the same
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          -- class member inferred type
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = false,
        },
      },
    },

    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false

      lsp_attach(client, bufnr)
    end
  },

  tailwindcss = {
    filetypes = {'javascriptreact', 'typescriptreact', 'html'},
  },
}

function lsp_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'go', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)

  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end

  -- only reopen floating diagnostic window once the cursor moves. this prevents the
  -- floating diagnostic window from covering other floating windows (like hover)
  local group = vim.api.nvim_create_augroup('LSPDiagnosticOnHover', { clear = false })
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

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()
mason_lspconfig.setup_handlers {
  function(name)
    local default_cfg = {
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    }

    local custom_cfg = custom_configs[name] or {}

    lspconfig[name].setup(
      vim.tbl_deep_extend('force', default_cfg, custom_cfg)
    )
  end
}
