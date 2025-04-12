return {
  'xiyaowong/transparent.nvim',
  opts = {
    extra_groups = {
      'NormalFloat',
      'TelescopeBorder',
      'FloatBorder',
      'MsgSeparator',
      'WinSeparator',
    },
    exclude_groups = {
      -- 'CursorLine',
      -- 'CursorLineNr',
      -- 'NeoTreeCursorLine',
      'PmenuSel',
      'NeoTreeTitleBar',
      'NoiceCusror',
      'NoicePopupmenuSelected',
      -- 'NoiceCmdlinePopup',
    },
  },
  config = function(_, opts)
    vim.g.transparent_enabled = true
    require('transparent').setup(opts)
    require('transparent').clear_prefix 'neotree'
    require('transparent').clear_prefix 'lualine'
    require('transparent').clear_prefix 'Pmenu'
    require('transparent').clear_prefix 'Float'
    require('transparent').clear_prefix 'Tab'
    require('transparent').clear_prefix 'whichkey'
    require('transparent').clear_prefix 'GitSigns'
    require('transparent').clear_prefix 'Noice'
    require('transparent').clear_prefix 'DiagnosticSign'
    require('transparent').clear_prefix 'Notify'
    require('transparent').clear_prefix 'Telescope'
  end,
}
