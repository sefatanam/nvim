return {
  'tanvirtin/vgit.nvim',
  branch = 'v1.0.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  config = function()
    require("vgit").setup({
      keymaps = {
        ['n <C-k>'] = function() require('vgit').hunk_up() end,
        ['n <C-j>'] = function() require('vgit').hunk_down() end,
        ['n <leader>gs'] = function() require('vgit').buffer_hunk_stage() end,
        ['n <leader>gr'] = function() require('vgit').buffer_hunk_reset() end,
        ['n <leader>gp'] = function() require('vgit').buffer_hunk_preview() end,
        ['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
        ['n <leader>gf'] = function() require('vgit').buffer_diff_preview() end,
        ['n <leader>gh'] = function() require('vgit').buffer_history_preview() end,
        ['n <leader>gu'] = function() require('vgit').buffer_reset() end,
        ['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
        ['n <leader>gx'] = function() require('vgit').toggle_diff_preference() end,
      },
    })
  end,
}
