return {
  'shortcuts/no-neck-pain.nvim',
  opts = {
    autocmds = {
      enableOnVimEnter = 'safe',
      skipEnteringNoNeckPainBuffer = true,
    },
    mappings = {
      enabled = true,
    },
    width = 60,
    minSideBufferWidth = 0,
    buffers = {
      right = {
        enabled = false,
      },
      -- scratchPad = {
      --   -- set to `false` to
      --   -- disable auto-saving
      --   enabled = true,
      --   -- set to `nil` to default
      --   -- to current working directory
      --   location = '~/Documents/',
      -- },
      -- bo = {
      --   filetype = 'md',
      -- },
    },
  },
  -- stylua: ignore
  -- keys = {
  -- { "<leader>nn", "<cmd>NoNeckPain<cr>", desc = "No Neck Pain" },
  -- },
}
