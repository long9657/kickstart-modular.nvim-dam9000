return {
  {
    'CRAG666/code_runner.nvim',
    config = function()
      require('code_runner').setup {
        filetype = {
          java = {
            'cd $dir &&',
            'javac $fileName &&',
            'java $fileNameWithoutExt',
          },
          python = 'python3 -u',
          typescript = 'deno run',
          rust = {
            'cd $dir &&',
            'rustc $fileName &&',
            '$dir/$fileNameWithoutExt',
          },
          c = function(...)
            c_base = {
              'cd $dir &&',
              'gcc $fileName -o',
              '/tmp/$fileNameWithoutExt',
            }
            local c_exec = {
              '&& /tmp/$fileNameWithoutExt &&',
              'rm /tmp/$fileNameWithoutExt',
            }
            vim.ui.input({ prompt = 'Add more args:' }, function(input)
              c_base[4] = input
              vim.print(vim.tbl_extend('force', c_base, c_exec))
              require('code_runner.commands').run_from_fn(vim.list_extend(c_base, c_exec))
            end)
          end,
        },
      }
      vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
      vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
    end,
  },
  --   {
  --     "CRAG666/betterTerm.nvim",
  --     opts = {
  --         position = "bot",
  --         size = 15,
  --       },
  --     config = function()
  --         local betterTerm = require('betterTerm')
  --         -- toggle firts term
  --         vim.keymap.set({"n", "t"}, "<C-;>", betterTerm.open, { desc = "Open terminal"})
  --         -- Select term focus
  --         vim.keymap.set({"n"}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})
  --         -- Create new term
  --         local current = 2
  --         vim.keymap.set(
  --         {"n"}, "<leader>tn",
  --         function()
  --         betterTerm.open(current)
  --         current = current + 1
  --         end,
  --         { desc = "New terminal"}
  --         )
  --     end,
  -- }
}
