local vim = vim
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
  { import = "custom.hot-plugins" },
  { import = "custom.plugins" }
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "custom.options"
require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
  require "custom.mappings"
end)

-- vim.diagnostic.open_float()


-- local lspconfig = require("lspconfig")
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- vim.diagnostic.config({
--   underline = false,
--   -- virtual_text = false, -- Turn off inline diagnostics
--   virtual_text = {
--     prefix = "●",
--     source = "always",
--     spacing = 2,
--     severity_sort = true,
--     format = function(diagnostic)
--       -- return string.format("%s (%s)", diagnostic.message, diagnostic.source or "LSP")
--       return string.format("<- Hey,A error is here !💀")
--     end,
--   },
--   float = {
--     border = "rounded", -- Use "rounded" instead of a table for simplicity
--     source = "always",
--     update_in_insert = true,
--     severity_sort = true,
--   },
-- })
--
-- vim.o.updatetime = 100
--
-- -- Show diagnostics on CursorHold
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, max_width=80})]]
-- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- local on_attach = function(client, bufnr)
-- print("LSP started.")
--
-- local opts = { noremap = true, silent = true }
-- -- Better keymap API with `vim.keymap.set`
-- local keymap = vim.keymap.set
-- keymap('n', '<Leader>gd', vim.lsp.buf.definition, opts)
-- keymap('n', '<Leader>gt', vim.lsp.buf.type_definition, opts)
-- keymap('n', '<Leader>gi', vim.lsp.buf.implementation, opts)
-- keymap('n', '<Leader>gu', vim.lsp.buf.references, opts)
-- keymap('n', '<Leader>gr', vim.lsp.buf.rename, opts)
-- end

-- local servers = {"ccls", "gopls", "pylsp", "rust_analyzer", "terraformls"}

-- for _, server in pairs(servers) do
--   lspconfig[server].setup {
--     capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     -- on_attach = on_attach,
--     handlers = {
--       -- Disable virtual text and underline in diagnostics
--       ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
--         config = config or {}
--         config.virtual_text = false
--         config.underline = false
--         return vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
--       end,
--     },
--   }
-- end
