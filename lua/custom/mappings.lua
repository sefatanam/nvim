local vim = vim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- https://github.com/joeveiga/ng.nvim?tab=readme-ov-file
local ng = require("ng");

-- Keymap for terminal mode
map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Keymap for normal mode
vim.api.nvim_set_keymap('n', '<leader>gg', ':lua LazygitToggle()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':Telescope quickfix<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>lg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>bd', '::bufdo bwipeout<CR>', opts)

vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, opts)
vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, opts)
vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "I", vim.lsp.buf.implementation, opts)

map("n", "<C-t>", function() require("menu").open("default") end, {})
map('n', '<C-p>', ":Telescope find_files<CR>", opts)

-- Keymap for visual mode
vim.api.nvim_set_keymap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

-- Keymap for all mode
map({ 'i', 'n', 'v' }, '<C-f>', function() vim.lsp.buf.format({ async = true }) end, opts)
map({ 'i', 'n', 'v' }, "<C-s>", "<cmd> wa <cr>", opts)

-- mouse users + nvimtree users!
map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- function for custom triggers and commands
function LazygitToggle()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "curved", -- or "single", "double", etc.
    },
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
    on_close = function(term)
      vim.cmd("startinsert!")
    end,
  })
  lazygit:toggle()
end
