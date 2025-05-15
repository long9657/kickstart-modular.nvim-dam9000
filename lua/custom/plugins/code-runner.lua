return {
  {
    'CRAG666/code_runner.nvim',
    opts = {
      mode = 'float',
      float = {
        border = 'rounded',
      },
    },
    keys = {
      { '<leader>rr', '<cmd>RunCode<cr>', desc = 'Run Code' },
      { '<leader>rf', '<cmd>RunFile<cr>', desc = 'Run File' },
      { '<leader>rp', '<cmd>RunProject<cr>', desc = 'Run Project' },
      { '<leader>rc', '<cmd>RunClose<cr>', desc = 'Close Runner' },
    },
  },
}
