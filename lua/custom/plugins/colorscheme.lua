return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000,
    config = function()
      -- Set default theme
      local themes = {
        'tokyonight',
        'catppuccin',
        'kanagawa',
        'rose-pine',
        'tender',
        'cyberdream',
      }

      local current_theme_index = 1
      -- Set default theme (first theme)
      vim.cmd.colorscheme(themes[current_theme_index])

      -- Key mapping to switch themes (e.g., <leader>nt)
      vim.keymap.set('n', '<leader>nt', function()
        current_theme_index = current_theme_index + 1
        if current_theme_index > #themes then
          current_theme_index = 1
        end
        local theme = themes[current_theme_index]
        vim.cmd.colorscheme(theme)
        print('Change nvim theme to: ' .. theme)
      end, { noremap = true, silent = true })
    end,
  },

  {
    'jacoborus/tender.vim',
    name = 'tender',
    priority = 800,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 900,
  },

  {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    priority = 910,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 910,
  },

  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    name = 'cyberdream',
    priority = 910,
    config = function()
      require('cyberdream').setup {
        italic_comments = true,
        hide_fillchars = false,
        borderless_telescope = true,
        terminal_colors = true,
      } -- Add a custom keybinding to toggle the colorscheme
      vim.api.nvim_set_keymap('n', '<leader>tt', ':CyberdreamToggleMode<CR>', { noremap = true, silent = true })
    end,
  },
}
