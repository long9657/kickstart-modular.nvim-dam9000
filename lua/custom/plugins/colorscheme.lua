return {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        transparent = not vim.g.neovide,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      } -- Add a custom keybinding to toggle the colorscheme
      vim.api.nvim_set_keymap('n', '<leader>tt', ':CyberdreamToggleMode<CR>', { noremap = true, silent = true })
      vim.cmd 'colorscheme cyberdream'
    end,
  },
}
