return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    -- Set shell to PowerShell 7 if on Win32 or Win64
    if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
      vim.opt.shell = 'pwsh -NoLogo -CustomPipeName vim'
      vim.opt.shellcmdflag =
        '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
      vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
      vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
      vim.opt.shellquote = ''
      vim.opt.shellxquote = ''
    end
    require('toggleterm').setup {
      open_mapping = [[<C-`>]],
      direction = 'float',
    }
  end,
}
