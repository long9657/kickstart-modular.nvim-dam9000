--Some highlight groups may not be defined by the colorscheme so we have to clear it
--manually"
return {
  'xiyaowong/transparent.nvim',
  opts = {
    extra_groups = {
      'Winbar',
      'WinbarNC',
      'Folded',
      'NormalFloat',
      'FloatBorder',
      'MsgSeparator',
      'WinSeparator',
      'TelescopeNormal',
      'TelescopeBorder',
      'TelescopePromptTitle',
      'TelescopePromptBorder',
      'TelescopePreviewTitle',
      'TelescopeResultsTitle',
      'Pmenu',
      'BlinkCmpMenu',
      'BlinkCmpMenuBorder',
      'BlinkCmpDoc',
      'BlinkCmpDocBorder',
      'BlinkCmpSignatureHelp',
      'BlinkCmpSignatureHelpBorder',
      'LspInlayHint',
      'LspSignatureActiveParameter',
    },
    exclude_groups = {
      'CursorLine',
      -- 'CursorLineNr',
      'NoiceCursor',
      'NoicePopupmenuSelected',
      'NoiceCmdlinePopup',
    },
    on_clear = function()
      require('transparent').clear_prefix 'neotree'
      require('transparent').clear_prefix 'whichkey'
      require('transparent').clear_prefix 'GitSigns'
      require('transparent').clear_prefix 'Noice'
      require('transparent').clear_prefix 'Diagnostic'
      require('transparent').clear_prefix 'Notify'
      require('transparent').clear_prefix 'lualine'
      require('transparent').clear_prefix 'TreesitterContext'
      -- require('transparent').clear_prefix 'Pmenu'
      -- require('transparent').clear_prefix 'Float'
      -- require('transparent').clear_prefix 'Tab'
    end,
  },
  config = function(_, opts)
    require('transparent').setup(opts)
    vim.keymap.set('n', '<leader>tt', '<cmd>TransparentToggle<cr>', {
      desc = 'Toggle [t]ransparency',
    })
    vim.g.transparent_enabled = true
  end,
}
