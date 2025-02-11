local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    typescript = { "prettier" },
    htmlangular = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    scss = { "prettier" },
    vue = { "prettier" },
    fish = { "fish_indent" },
    sh = { "shfmt", "shellharden" },
    bash = { "shfmt", "shellharden" },
    markdown = { "cbfmt", "prettierd", "markdownlint" },
    go = { "goimports", "gofumpt" },
    templ = { "templ", "injected" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
