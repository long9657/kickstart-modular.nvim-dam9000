return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      vim.api.nvim_set_keymap('n', '<leader>tt', ':CyberdreamToggleMode<CR>', { noremap = true, silent = true }),
    }
    -- vim.cmd [[colorscheme cyberdream]]
    -- Add a custom keybinding to toggle the colorscheme
  end,
}
