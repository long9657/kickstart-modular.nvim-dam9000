--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- Settings
  vim.o.guifont = 'Comic Code:h16' -- text below applies for VimScript
  vim.g.neovide_fullscreen = true
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.6
  vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_text_gamma = 0.8
  -- vim.g.neovide_text_contrast = 0.1
  -- vim.g.neovide_floating_shadow = false
  -- vim.g.neovide_floating_blur_amount_x = 10
  -- vim.g.neovide_floating_blur_amount_y = 10
  -- vim.g.neovide_normal_opacity = 0.0

  -- Tell Neovim which highlight group to use for each mode
  -- Map modes to cursor shapes + highlight groups
  -- vim.opt.guicursor = {
  --   'n-v-c:block-CursorNormal', -- normal/visual/command → block using CursorNormal
  --   'i-ci-ve:ver25-CursorInsert', -- insert/command-insert → vertical bar using CursorInsert
  --   'r-cr:hor20-CursorReplace', -- replace modes → underline using CursorReplace
  -- }
  --
  -- -- Now define the colors for those groups
  -- vim.api.nvim_set_hl(0, 'CursorNormal', { bg = 'blue', fg = 'white' })
  -- vim.api.nvim_set_hl(0, 'CursorInsert', { bg = 'purple', fg = 'black' })
  -- vim.api.nvim_set_hl(0, 'CursorReplace', { bg = 'red', fg = 'white' })

  -- Keymaps
  vim.keymap.set('n', '<C-S-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Scaling changes
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
  vim.keymap.set('n', '<C-=>', function() change_scale_factor(1.25) end)
  vim.keymap.set('n', '<C-->', function() change_scale_factor(1 / 1.25) end)
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

-- [[ Floating terminal ]]
require 'floating-term'

--[[ Help-floating ]]
require 'help-floating'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
