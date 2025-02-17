return {
  {
    "nvim-telescope/telescope.nvim", -- Telescope plugin
    cmd = "Telescope",               -- Lazy load on the command
    config = function()
      require("telescope").setup {
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git",
            ".cache",
            ".github",
            ".vscode",
            ".idea",
            ".gitignore",
            ".gitattributes",
            ".gitmodules",
            ".DS_Store",
            ".editorconfig",
            ".eslintignore",
            ".eslintrc",
            ".prettierignore",
            ".prettierrc",
            ".stylelintrc",
            ".stylelintignore",
            ".huskyrc",
            ".lintstagedrc",
            ".browserslistrc",
            ".babelrc",
            "package-lock.json",
            "yarn.lock",
            "composer.lock",
            "Gemfile.lock",
            "package.json"
          },
          vimgrep_arguments = {
            'rg', '--color=always', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case', '--hidden',
            '--glob', '!.git/', '--glob', '!node_modules/'
          },
        },
        extensions = {
          require("telescope").load_extension("ui-select"),
        }
      }
    end,
    {
      "nvim-telescope/telescope-ui-select.nvim",
      lazy = false,
      require("telescope").setup {
        pickers = {
          quickfix = {
            theme = "dropdown", -- Optional: Set a theme for the quickfix picker
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git",
            ".cache",
            ".github",
            ".vscode",
            ".idea",
            ".gitignore",
            ".gitattributes",
            ".gitmodules",
            ".DS_Store",
            ".editorconfig",
            ".eslintignore",
            ".eslintrc",
            ".prettierignore",
            ".prettierrc",
            ".stylelintrc",
            ".stylelintignore",
            ".huskyrc",
            ".lintstagedrc",
            ".browserslistrc",
            ".babelrc",
            "package-lock.json",
            "yarn.lock",
            "composer.lock",
            "Gemfile.lock",
            "package.json"
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob', '!.git/',
            '--glob', '!node_modules/'
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
    }
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  }
}
