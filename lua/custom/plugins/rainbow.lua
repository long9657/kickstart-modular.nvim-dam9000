return {
  'HiPhish/rainbow-delimiters.nvim',
  submodules = false,
  lazy = false,
  main = 'rainbow-delimiters.setup',
  config = function()
    vim.api.nvim_create_autocmd('WinScrolled', {
      callback = function()
        vim.schedule(function()
          require('rainbow-delimiters').enable(0)
        end)
      end,
    })
  end,
}
