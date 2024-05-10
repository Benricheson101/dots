local function lsp_attach(client, bufnr)
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
    -- DEPRECATED: vim.lsp.inlay_hint.enable(bufnr, true)
    vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
  end

  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end

  -- no syntax highlighting from LSP. use treesitter instead
  client.server_capabilities.semanticTokensProvider = nil

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

return {
  {
    'neovim/nvim-lspconfig',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'folke/neodev.nvim',
    },

    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local lspconfig = require('lspconfig')

      -- TODO: is it possible to remove the concealed ```lua line from the popup
      local floating_window_options = {
        border = 'rounded',
        focusable = false,
      }

      vim.diagnostic.config {
        virtual_text = false,
        underline = true,
        signs = true,
        float = floating_window_options,
      }

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        floating_window_options
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        floating_window_options
      )

      -- vim.lsp.set_log_level(1)

      local lsp_capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      local custom_configs = require('config.lsp-servers')(lsp_attach)
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
    end,
  },

  {
    'folke/neodev.nvim',
    lazy = true,
    opts = {
      library = {
        enabled = true,
        runtime = true,
        types = true,
        plugins = false,
      },
    },
  },
}
