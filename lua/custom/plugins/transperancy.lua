return {
  'xiyaowong/transparent.nvim',
  opts = {},
  config = function()
    require('transparent').clear_prefix 'NeoTree'
    require('transparent').clear_prefix 'lualine'
  end,
}
