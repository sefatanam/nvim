return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  }, {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "svelte",
        "angularls",
        "ts_ls",
        "denols",
        "jsonls",
        "gopls",
        "rust_analyzer",
        "dockerls",
        "cmake",
        "astro",
        "bashls",
        "lua_ls"
      },
      auto_install = true,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Setup LSP servers
    mason_lspconfig.setup_handlers({
      function(server_name) -- Default setup for all servers
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["ts_ls"] = function()
        lspconfig.ts_ls.setup({
          root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
          capabilities = capabilities,
        })
      end,
      ["denols"] = function()
        lspconfig.denols.setup({
          root_dir = function(fname)
            local root = lspconfig.util.root_pattern("deno.json", "deno.jsonc")(fname)
            if root then
              return root
            end
            return nil
          end,
          capabilities = capabilities,
        })
      end,
      ["gopls"] = function()
        lspconfig.gopls.setup({
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            require('nvchad.configs.lspconfig').on_attach(client, bufnr)
          end,
          on_init = require('nvchad.configs.lspconfig').on_init,
          capabilities = capabilities,
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gotmpl", "gowork" },
          root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              completeUnimported = true,
              usePlaceholders = true,
              staticcheck = true,
            },
          },
        })
      end,
      ["angularls"] = function()
        local ok, mason_registry = pcall(require, 'mason-registry')
        if not ok then
          vim.notify 'mason-registry could not be loaded'
          return
        end
        local angularls_path = mason_registry.get_package('angular-language-server'):get_install_path()
        local cmd = {
          'ngserver',
          '--stdio',
          '--tsProbeLocations',
          table.concat({
            angularls_path,
            vim.uv.cwd(),
          }, ','),
          '--ngProbeLocations',
          table.concat({
            angularls_path .. '/node_modules/@angular/language-server',
            vim.uv.cwd(),
          }, ','),
        }
        local config = {
          cmd = cmd, -- The dynamically built command
          on_new_config = function(new_config, new_root_dir)
            new_config.cmd = cmd
          end,
          root_dir = lspconfig.util.root_pattern('angular.json', '.git'),                           -- Detect Angular projects
          filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" }, -- File types for Angular
          on_attach = require('nvchad.configs.lspconfig').on_attach,                                -- Attach custom LSP behaviors
          capabilities = capabilities,
        }
        lspconfig.angularls.setup(config)
      end,
    })
  end,
}
}
