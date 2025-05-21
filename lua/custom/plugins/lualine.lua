return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      globalstatus = true,
      theme = 'OceanicNext',
      section_separators = '',
      component_separators = '',
      disabled_filetypes = { 'neo-tree' },
    },
    sections = {
      lualine_z = {
        {
          'datetime',
          style = 'default',
        },
      },
    },
  },
}
