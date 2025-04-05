return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        color_overrides = {
          frappe = {
            overlay2 = '#eed49f',
          },
        },
      }
      -- vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
  {
    'Rigellute/shades-of-purple.vim',
    config = function()
      -- vim.cmd.colorscheme 'shades_of_purple'
    end,
  },
  {
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
  },
}
