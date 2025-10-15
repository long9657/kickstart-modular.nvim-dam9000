return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = function()
      local parser_installed = {
        'bash',
        'cpp',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'latex',
        'typst',
        'yaml',
        'vim',
        'vimdoc',
        'python',
        'java',
        'tsx',
        'javascript',
        'typescript',
        'json',
      }
      require('nvim-treesitter').install(parser_installed)
      require('nvim-treesitter').update()
    end,
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local filetype = args.match
          local lang = vim.treesitter.language.get_lang(filetype)
          if vim.treesitter.language.add(lang) then
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.treesitter.start()
          end
        end,
      })
    end,
  },
}
