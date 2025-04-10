return {
  'xiyaowong/transparent.nvim',
  opts = {
    extra_groups = {
      'NormalFloat',
      'TelescopeBorder',
    },
    exclude_groups = {
      'CursorLine',
      'CursorLineNr',
    },
  },
  config = function(_, opts)
    vim.g.transparent_enabled = not vim.g.neovide
    require('transparent').setup(opts)
    require('transparent').clear_prefix 'neotree'
    require('transparent').clear_prefix 'lualine'
    require('transparent').clear_prefix 'whichkey'
  end,
}
