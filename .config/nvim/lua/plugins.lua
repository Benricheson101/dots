local packer = require('packer')

vim.cmd.packadd('packer.nvim')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Shatur/neovim-ayu'
  use 'Everblush/nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use 'nvim-treesitter/playground'
  use 'RRethy/nvim-treesitter-endwise'

  use 'projectfluent/fluent.vim'

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'AndrewRadev/splitjoin.vim'
  -- use 'jiangmiao/auto-pairs'
  use 'adelarsq/vim-matchit'
  use 'mbbill/undotree'
  -- use 'sbdchd/neoformat'
  -- use 'mhartington/formatter.nvim'

	use 'windwp/nvim-autopairs'

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
    'L3MON4D3/LuaSnip',
    tag = 'v2.*',
    run = 'make install_jsregexp',
    requires = {
      'rafamadriz/friendly-snippets',
      'honza/vim-snippets',
    },
  }

  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'jay-babu/mason-nvim-dap.nvim'
    }
  }

  use {
    'b0o/schemastore.nvim',
    -- ft = {'json', 'yaml'}
  }

  use {
    'hrsh7th/nvim-cmp',
    after = {'LuaSnip'},
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    }
  }

  use {
    'folke/neodev.nvim',
    after = {'nvim-cmp'}
  }

  use {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    'norcalli/nvim-colorizer.lua',
    -- ft = {'css', 'scss'}
  }

  -- use 'mfussenegger/nvim-dap'

  -- use {
  --   'rcarriga/nvim-dap-ui',
  --   requires = {
  --     'mfussenegger/nvim-dap',
  --     'folke/neodev.nvim',
  --   }
  -- }

  use {
    'simrat39/rust-tools.nvim',
    ft = {'rust'}
  }

  use {
    'elixir-editors/vim-elixir',
    ft = {'elixir'}
  }

  use {
    'vim-crystal/vim-crystal',
    ft = {'crystal'},
  }

  use {
    'mattn/emmet-vim',
    ft = {
      'html',
      'javascriptreact',
      'typescriptreact',
      'svelte',
    },
  }

  use {
    'dcampos/cmp-emmet-vim',
    ft = {
      'html',
      'javascriptreact',
      'typescriptreact',
      'svelte',
    },
  }
  use {
    'IndianBoy42/tree-sitter-just',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
    -- ft = {
    --   'make',
    --   'just'
    -- },
  }

  use 'dstein64/vim-startuptime'

  -- TODO:
  -- snipets
  -- dap
end)
