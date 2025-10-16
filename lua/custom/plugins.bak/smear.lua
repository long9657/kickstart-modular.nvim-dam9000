local terminal = os.getenv 'TERM'
if terminal == 'xterm-kitty' then
  return {}
end

return {
  'sphamba/smear-cursor.nvim',
  -- enabled = not vim.g.neovide,
  opts = { -- Default  Range
    stiffness = 0.8, -- 0.6      [0, 1]
    trailing_stiffness = 0.5, -- 0.4      [0, 1]
    stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
    damping = 0.8, -- 0.65     [0, 1]
    damping_insert_mode = 0.8, -- 0.7      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
    time_interval = 7, -- milliseconds
    transparent_bg_fallback_color = '#FFFFFF',
  },
}
