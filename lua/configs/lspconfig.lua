-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = require('nvchad.configs.lspconfig').on_attach
local on_init = require('nvchad.configs.lspconfig').on_init


local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
-- EXAMPLE
-- local servers = { "html", "cssls", "ts_ls", "denols", "jsonls", "gopls", "rust_analyzer", "dockerls", "lua_ls" }

lspconfig.servers = { 'html', 'cssls', 'jsonls', 'lua_ls', 'dockerls', 'ts_ls', 'denols', 'rust_analyzer', 'gopls',
  'angularls' }

local servers = {
  "html",
  "cssls",
  "jsonls",
  "lua_ls",
  "dockerls",
  "ts_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.angularls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = util.root_pattern("angular.json", "angular.json", ".git", "nx.json", "project.json"),
}
