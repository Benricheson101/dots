vim.cmd.packadd('packer.nvim')

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Shatur/neovim-ayu'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-tree-docs',
    }
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
    tag = 'nightly',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  use {
    "L3MON4D3/LuaSnip",
    tag = "v1.2.*",
    run = "make install_jsregexp"
  }

  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim'
    }
  }

  use 'b0o/schemastore.nvim'

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path'
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use 'mfussenegger/nvim-dap'

  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap',
      'folke/neodev.nvim',
    }
  }

  -- use {
  --   'mxsdev/nvim-dap-vscode-js',
  --   requires = {
  --     'mfussenegger/nvim-dap'
  --   }
  -- }

  use 'simrat39/rust-tools.nvim'

  -- TODO:
  -- snipets
  -- dap
end)
