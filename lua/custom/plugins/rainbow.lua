return {
  {
    'hiphish/rainbow-delimiters.nvim', -- Powered by Tree-sitter
    submodules = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        vim = 'rainbow-delimiters.strategy.local',
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    },
    main = 'rainbow-delimiters.setup', -- Required. Defaults to the repository name if not set.
  },
}
