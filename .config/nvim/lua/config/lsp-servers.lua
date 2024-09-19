return function(lsp_attach)
  local schemastore = require('schemastore')
  local lspconfig = require('lspconfig')

  return {
    biome = {
      root_dir = lspconfig.util.root_pattern('biome.json'),
      filetypes = {
        'javascript',
        'javascriptreact',
        'json',
        'jsonc',
        'typescript',
        'typescript.tsx',
        'typescriptreact'
      },
    },

    clangd = {
      filetypes = {
        'c',
        'cpp',
      },
    },

    rust_analyzer = {
      flags = {
        exit_timeout = 0,
      },

      settings = {
        rust = {
        },
      },
    },

    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },

          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },

          telemetry = {
            enable = false,
          },
        },
      },
    },

    jsonls = {
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = {
            enable = true,
          },
        },
      },
    },

    tsserver = {
      settings = {
        javascript = {
          format = {
            enable = false,
          },
        },
        typescript = {
          format = {
            enable = false,
          },
          inlayHints = {
            -- shows the value of an enum member in its declaration
            includeInlayEnumMemberValueHints = true,
            -- shows the inferred return type of a function
            includeInlayFunctionLikeReturnTypeHints = false,
            includeInlayFunctionParameterTypeHints = true,
            -- parameters in function calls
            includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
            -- shows the parameter name in a function when both the parameter name and input variable name are the same
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            -- class member inferred type
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = false,
          },
        },
      },

      on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        client.server_capabilities.documentFormattingProvider = false -- 0.8 and later

        require('twoslash-queries').attach(client, bufnr)
        lsp_attach(client, bufnr)
      end
    },

    tailwindcss = {
      root_dir = lspconfig.util.root_pattern('tailwind.config.js'),
      filetypes = {'javascriptreact', 'typescriptreact', 'html'},
    },

    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            pyflakes = {
              enabled = false,
            },
            pycodestyle = {
              enabled = false,
            },
          },
        },
      },
    },
    -- pywright = {
    --   root_dir = lspconfig.util.root_pattern('biome.json'),
    --   filetypes = {
    --     'javascript',
    --     'javascriptreact',
    --     'json',
    --     'jsonc',
    --     'typescript',
    --     'typescript.tsx',
    --     'typescriptreact'
    --   },
    -- },

    -- yamlls = {
    --   settings = {
    --     yaml = {
    --       schemaStore = {
    --         enable = true,
    --         url = "https://www.schemastore.org/api/json/catalog.json",
    --       },

    --       trace = {
    --         server = "verbose",
    --       },

    --       -- schemas = require('schemastore').yaml.schemas {
    --       --   select = {
    --       --     'docker-compose.yml',

    --       --   }
    --       -- }
    --     },
    --   },
    -- },
  }

end
