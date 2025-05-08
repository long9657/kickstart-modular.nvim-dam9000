return {
  'sphamba/smear-cursor.nvim',
  enabled = not vim.g.neovide,
  opts = {
    legacy_computing_symbols_support = true,
    hide_target_hack = false,
    -- Sets animation framerate
    time_interval = 10, -- milliseconds
    -- Amount of time the cursor has to stay still before triggering animation.
    -- Useful if the target changes and rapidly comes back to its original position.
    -- E.g. when hitting a keybinding that triggers CmdlineEnter.
    -- Increase if the cursor makes weird jumps when hitting keys.
    delay_event_to_smear = 1, -- milliseconds

    -- Delay for `vim.on_key` to avoid redundancy with vim events triggers.
    delay_after_key = 5, -- milliseconds
  },
}
