local function create_autocmds(cmds)
  for _, c in ipairs(cmds) do
    local e, d, cb = unpack(c)
    vim.api.nvim_create_autocmd(e, { desc = d, callback = cb })
  end
end

create_autocmds {
  {
    { 'InsertLeave', 'WinEnter' },
    'Show cursor line in active window',
    function(ev)
      if vim.bo[ev.buf].buftype == '' then
        vim.opt_local.cursorline = true
      end
    end,
  },
  {
    { 'InsertEnter', 'WinLeave' },
    'Hide cursor line in inactive windows',
    function()
      vim.opt_local.cursorline = false
    end,
  },
  {
    { 'VimEnter', 'VimResume', 'ColorScheme' },
    'Sync terminal background color',
    function()
      if vim.g.colors_name == nil then
        return
      end
      io.stdout:write(string.format('\027]11;#%06x\007', vim.api.nvim_get_hl(0, { name = 'normal' }).bg))
    end,
  },
  {
    { 'VimLeavePre', 'VimSuspend' },
    'Revert terminal background color',
    function()
      io.stdout:write '\027]111;;\007'
    end,
  },
}
