return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/nvim-session' },
    -- log_level = 'debug',
  },

  config = function()
    require('auto-session').setup {
    }
  end
}
