-- local tableutil = require('util.table')

-- local dap = require('dap')
-- local dap_vscode = require('dap.ext.vscode')
-- -- local dap_js = require('dap-vscode-js')
-- local dapui = require('dapui')
-- local rusttools = require('rust-tools')
-- local rusttools_dap = require('rust-tools.dap')

-- local mason_packages_path = vim.fn.stdpath('data') .. '/mason/packages'

-- -- dap_js.setup {
-- --   debugger_path = mason_packages_path .. '/js-debug-adapter',
-- --   adapters = {
-- --     'pwa-node',
-- --     'pwa-chrome',
-- --     'pwa-msedge',
-- --     'node-terminal',
-- --     'pwa-extensionHost'
-- --   },
-- -- }

-- local adapters = {
--   codelldb = {
--     type = 'server',
--     port = '${port}',
--     executable = {
--       command = mason_packages_path .. '/codelldb/codelldb',
--       args = { '--port', '${port}' }
--     }
--   }
-- }

-- -- FIXME: dap-vscode-js never kills the server

-- local configurations = {
--   -- javascript = {
--   --   {
--   --     name = 'launch',
--   --     type = 'pwa-node',
--   --     request = 'launch',
--   --     cwd = vim.fn.getcwd(),
--   --     args = { '${file}' },
--   --     protocol = 'inspector',
--   --     resolveSourceMapLocations = {
--   --       '${workspaceFolder}/**',
--   --       '!**/node_modules/**'
--   --     },
--   --   },
--   -- },

--   -- typescript = {
--   --   {
--   --     name = 'launch',
--   --     type = 'pwa-node',
--   --     request = 'launch',
--   --     cwd = vim.fn.getcwd(),
--   --     args = { '${file}' },
--   --     protocol = 'inspector',
--   --     resolveSourceMapLocations = {
--   --       '${workspaceFolder}/**',
--   --       '!**/node_modules/**',
--   --     },
--   --   },
--   -- },

--   -- cpp = {
--   --   {
--   --     name = 'Launch file',
--   --     type = 'codelldb',
--   --     request = 'launch',
--   --     cwd = '${workspaceFolder}',
--   --     stopOnEntry = false,
--   --     program = function()
--   --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--   --     end,
--   --   }
--   -- }
-- }

-- tableutil.merge_table(dap.adapters, adapters)
-- tableutil.merge_table(dap.configurations, configurations)

-- dap_vscode.load_launchjs(nil, {
--   codelldb = { 'c', 'cpp', 'rust' },
-- })

-- rusttools.setup {
--   dap = {
--     adapter = rusttools_dap.get_codelldb_adapter(
--       mason_packages_path .. '/codelldb/extension/adapter/codelldb',
--       mason_packages_path .. '/codelldb/extension/lldb/lib/liblldb.dylib'
--     )
--   }
-- }

-- dapui.setup()
-- dap.listeners.after.event_initialized['dapui_config'] = function()
--   dapui.open()
-- end

-- -- dap.listeners.before.event_terminated["dapui_config"] = function()
-- --   dapui.close()
-- -- end
-- -- dap.listeners.before.event_exited['dapui_config'] = function()
-- --   dapui.close()
-- -- end

