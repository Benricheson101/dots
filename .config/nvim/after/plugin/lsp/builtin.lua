local border = 'rounded'
vim.diagnostic.config {
  virtual_text = false,
  float = {
    border = border,
  }
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = border,
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = border
  }
)
