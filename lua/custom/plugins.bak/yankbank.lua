return {
  'ptdewey/yankbank-nvim',
  lazy = false,
  cmd = { 'YankBank' },
  config = function()
    require('yankbank').setup {
      focus_gain_poll = true,
    }
    -- map to '<leader>y'
    vim.keymap.set('n', '<leader>yb', '<cmd>YankBank<CR>', { noremap = true })
  end,
}
