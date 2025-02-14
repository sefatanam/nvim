local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    typescript = { "prettierd" },
    htmlangular = { "prettierd" },
    javascript = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    scss = { "prettierd" },
    vue = { "prettierd" },
    fish = { "fish_indent" },
    sh = { "shfmt", "shellharden" },
    bash = { "shfmt", "shellharden" },
    markdown = { "cbfmt", "prettierd", "markdownlint" },
    go = { "goimports", "gofumpt" },
    templ = { "templ", "injected" },
  },
}

return options
