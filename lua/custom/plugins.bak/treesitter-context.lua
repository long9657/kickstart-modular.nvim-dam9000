return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'BufRead',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
  },
  opts = {
    multiwindow = true,
  },
}
