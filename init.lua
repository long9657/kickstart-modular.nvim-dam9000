--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here

  -- Default working directory
  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      vim.cmd 'cd D:/Code'
    end,
  })

  -- Settings
  vim.o.guifont = 'Inconsolata Nerd Font:h16' -- text below applies for VimScript
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_fullscreen = true
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_floating_blur_amount_x = 10
  vim.g.neovide_floating_blur_amount_y = 10
  vim.g.neovide_normal_opacity = 0.0

  -- Keymaps
  vim.keymap.set('n', '<C-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<C-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Scaling changes
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set('n', '<C-=>', function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set('n', '<C-->', function()
    change_scale_factor(1 / 1.25)
  end)
end
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Padding fix ]]
-- require 'padding-fix'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
