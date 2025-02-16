require('nvchad.configs.lspconfig')

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "angularls",
          "bashls",
          "dockerls",
          "gopls",
          "html",
          "ts_ls",
          "lua_ls",
          "cssls",
          "sqls",
          "yamlls",
          "zls"
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local on_attach = require('nvchad.configs.lspconfig').on_attach
      local on_init = require('nvchad.configs.lspconfig').on_init


      lspconfig.angularls.setup {
        on_attach = on_attach,
        on_init = on_init,
        cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "", "--angularCoreVersion", "" },
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("angular.json"),
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" }
      }
      lspconfig.bashls.setup {}
      lspconfig.dockerls.setup {}
      lspconfig.gopls.setup {
        cmd = { "gopls", "--remote=auto" },
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
      lspconfig.html.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
      lspconfig.ts_ls.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
        root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", ".git"),
      }
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
      lspconfig.cssls.setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
      lspconfig.sqls.setup {}
      lspconfig.yamlls.setup {}
      lspconfig.zls.setup {}
    end
  }
}
