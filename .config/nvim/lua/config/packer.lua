vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Shatur/neovim-ayu'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'adelarsq/vim-matchit'
  use 'mbbill/undotree'

  use 'Yggdroot/indentLine'
  use 'ntpeters/vim-better-whitespace'
  use 'chaoren/vim-wordmotion'

  use 'wakatime/vim-wakatime'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  use {
    "L3MON4D3/LuaSnip",
    tag = "v1.2.*",
    run = "make install_jsregexp"
  }

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- TODO:
  -- lsp
  -- snipets
  -- emmet
end)
