return {
  'shellRaining/hlchunk.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  -- enabled = false,
  config = function()
    require('hlchunk').setup {
      chunk = {
        enable = true,
      },
    }
  end,
}
