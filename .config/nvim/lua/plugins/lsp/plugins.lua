-- require 'plugins.lsp.config'

-- TODO: switch from coc to lspsaga
local lsp = {
	-- 'glepnir/lspsaga.nvim',
	-- 'neovim/nvim-lspconfig',

	['neoclide/coc.nvim'] = { run = 'yarn install --frozen-lockfile' },
}

return lsp
