local floating_window_options = {
    border = 'rounded',
    focusable = false,
}

vim.diagnostic.config {
  virtual_text = true,
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
