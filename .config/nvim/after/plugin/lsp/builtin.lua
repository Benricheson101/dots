local border = 'rounded'

vim.diagnostic.config {
  virtual_text = true,
  float = {
    border = border,
    focusable = false,
  }
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = border,
    focusable = false,
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = border,
    focusable = false,
  }
)

-- vim.lsp.set_log_level(1)
