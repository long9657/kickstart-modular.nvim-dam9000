return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>ws', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
    { '<leader>wd', '<cmd>AutoSession deletePicker<CR>', desc = 'DeletePicker autosave' },
  },
  opts = {
    (function() vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions' end)(),
    cwd_change_handling = true,
    auto_restore_last_session = false,
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    bypass_save_filetypes = {
      '',
      'no-neck-pain',
      'neo-tree',
      'noice',
      'notify',
    },
    -- post_save_cmds = {
    --   function()
    --     local cwd = vim.fn.getcwd()
    --     if not cwd or cwd == '' then
    --       return
    --     end
    --     local root = vim.loop.fs_realpath(cwd) or cwd
    --
    --     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    --       if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
    --         local name = vim.api.nvim_buf_get_name(buf)
    --         if name ~= '' then
    --           local path = vim.loop.fs_realpath(name) or name
    --           if not path:lower():find(root:lower(), 1, true) then
    --             if #vim.fn.win_findbuf(buf) == 0 then
    --               vim.api.nvim_buf_delete(buf, { force = false })
    --             end
    --           end
    --         end
    --       end
    --     end
    --   end,
    -- },
    --
    --linux
    --
    -- pre_save_cmds = {
    --   function()
    --     local cwd = vim.uv.cwd()
    --     local bufs = vim.api.nvim_list_bufs()
    --
    --     if not cwd then
    --       return
    --     end
    --     for _, buf in ipairs(bufs) do
    --       if vim.api.nvim_buf_is_loaded(buf) then
    --         local name = vim.api.nvim_buf_get_name(buf)
    --         if name ~= '' and not name:find(cwd, 1, true) then
    --           -- buffer has a name and is not under cwd, close it
    --           vim.api.nvim_buf_delete(buf, { force = true })
    --         end
    --       end
    --     end
    --   end,
    -- },
    --
    -- windows
    --
    pre_save_cmds = {
      function()
        local cwd = vim.uv.cwd()
        local bufs = vim.api.nvim_list_bufs()

        if not cwd then
          return
        end

        -- normalize cwd for Windows (slashes + lowercase)
        cwd = cwd:gsub('\\', '/'):lower()

        for _, buf in ipairs(bufs) do
          if vim.api.nvim_buf_is_loaded(buf) then
            local name = vim.api.nvim_buf_get_name(buf)
            if name ~= '' then
              -- normalize buffer path too
              local norm_name = name:gsub('\\', '/'):lower()
              if not norm_name:find(cwd, 1, true) then
                -- buffer has a name and is not under cwd, close it
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end
        end
      end,
    },
  },
}
