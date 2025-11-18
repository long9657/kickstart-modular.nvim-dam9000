return {
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000,
    config = function()
      -- Set default theme
      local themes = {
        'tokyonight-night',
        'shades_of_purple',
        'catppuccin',
        'solarized-osaka',
        'gruvbox',
        'cyberdream',
      }
      math.randomseed(vim.loop.now())
      local current_theme_index = math.random(#themes)
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
        vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'FloatBorder' })
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'white' })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#ead84e' })
        print('Change nvim theme to: ' .. theme)
      end, { desc = 'Change Nvim Theme', noremap = true, silent = true })
    end,
  },
  {
    'Rigellute/shades-of-purple.vim',
    name = 'shades_of_purple',
    priority = 900,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 900,
  },
  { 'ellisonleao/gruvbox.nvim', name = 'gruvbox', priority = 920 },
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
      }
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    name = 'solarized-osaka',
    opts = {},
  },
}
