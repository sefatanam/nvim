return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      auto_install = true,
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure_installed = {
      --   "json",
      --   "javascript",
      --   "typescript",
      --   "tsx",
      --   "yaml",
      --   "html",
      --   "css",
      --   "prisma",
      --   "markdown",
      --   "markdown_inline",
      --   "go",
      --   "gomod",
      --   "gosum",
      --   "gowork",
      --   "bash",
      --   "lua",
      --   "vim",
      --   "dockerfile",
      --   "gitignore",
      --   "query",
      -- },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
