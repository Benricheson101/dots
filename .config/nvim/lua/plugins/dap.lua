local lldb = {
  name = 'Launch lldb',
  type = 'lldb',
  request = 'launch',
  program = function()
    return vim.fn.input(
      'Path to executable: ',
      vim.fn.getcwd() .. '/',
      'file'
    )
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
  args = {},
  runInTerminal = false,
}

local codelldb = {
  name = 'Launch codelldb',
  type = 'codelldb',
  request = 'launch',
  program = function()
    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  end,
  cwd = '${workspaceFolder}',
  stopOnEntry = false,
}

local pwanode_launch = {
		type = 'pwa-node',
		request = 'launch',
		name = 'Launch file',
		-- program = '${file}',
  program = function()
    return vim.fn.input(
      'Path to executable: ',
      vim.fn.getcwd() .. '/',
      'file'
    )
  end,
		cwd = '${workspaceFolder}',
}


local pwanode_attach = {
	type = 'pwa-node',
	request = 'attach',
	name = 'Attach to Node app',
	address = 'localhost',
	port = 9229,
	cwd = '${workspaceFolder}',
	restart = true,
}

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'Weissle/persistent-breakpoints.nvim',
    },

    opts = {
      adapters = {
        lldb = {
          type = 'executable',
          command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
          name = 'lldb'
        },

        codelldb = {
          type = 'executable',
          command = '/Users/benricheson/.local/share/nvim/mason/bin/codelldb',
        },

        ['pwa-node'] = {
          type = 'server',
          -- host = '::1',
          -- host = 'localhost',
          port = '${port}',
          -- port = 9229,
          executable = {
            command = 'js-debug-adapter',
            args = {
              '${port}',
            },
          },
        },
      },

      configurations = {
        cpp = {lldb, codelldb},
        c = {lldb, codelldb},
        rust = {lldb, codelldb},
        zig = {lldb, codelldb},
        typescript = {pwanode_launch, pwanode_attach},
        javascript = {pwanode_launch, pwanode_attach},
        typescriptreact = {pwanode_launch, pwanode_attach},
        javascriptreact = {pwanode_launch, pwanode_attach},
      },
    },

    keys = {
      {
        '<leader>db',
        function() require('persistent-breakpoints.api').toggle_breakpoint() end,
        desc = '[DAP] Toggle Breakpoint'
      },

      {
        '<leader>dc',
        function() require('dap').continue() end,
        desc = '[DAP] Continue'
      },

      {
        '<leader>dC',
        function() require('dap').run_to_cursor() end,
        desc = '[DAP] Run to Cursor'
      },

      {
        '<leader>dT',
        function() require('dap').terminate() end,
        desc = '[DAP] Terminate'
      },

      {
        '<leader>dr',
        function() require('dap').repl_open() end,
        desc = '[DAP] Open REPL',
      },

      {
        '<Leader>dl',
        function() require('dap').run_last() end,
        desc = '[DAP] Run last',
      },

      {
        '<s-up>',
        function() require('dap').step_out() end
      },

      {
        '<s-down>',
        function() require('dap').step_into() end
      },

      {
        '<s-right>',
        function() require('dap').step_over() end,
      },

      {
        '<s-left>',
        function() require('dap').restart_frame() end,
      },
    },
      --   vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
      --   vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)

      -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      --   require('dap.ui.widgets').hover()
      -- end)
      -- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      --   require('dap.ui.widgets').preview()
      -- end)
      -- vim.keymap.set('n', '<Leader>df', function()
      --   local widgets = require('dap.ui.widgets')
      --   widgets.centered_float(widgets.frames)
      -- end)
      -- vim.keymap.set('n', '<Leader>ds', function()
      --   local widgets = require('dap.ui.widgets')
      --   widgets.centered_float(widgets.scopes)
      -- end)

    config = function(_, opts)
      local dap = require('dap')
      -- local widgets = require('dap.ui.widgets')

      for k, v in pairs(opts.adapters) do
        dap.adapters[k] = v
      end

      for k, v in pairs(opts.configurations) do
        dap.configurations[k] = v
      end

      -- local scopes = widgets.sidebar(widgets.scopes, {}, 'vsplit')
      -- local frames = widgets.sidebar(widgets.frames, {height = 10}, 'belowright split')

    end
  },

  {
    'Weissle/persistent-breakpoints.nvim',
    opts = {},
    config = true,
  },

  {
    'igorlfs/nvim-dap-view',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {},
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    },

    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI"
      },
    },

    opts = {
    },

    -- config = function (_, opts)
    --   local dapui = require('dap-ui')
    -- end
  }
}
