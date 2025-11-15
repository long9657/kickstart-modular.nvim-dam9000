-- lazy.nvim
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
    views = {
      notify = {
        replace = true,
      },
    },
    lsp = {
      signature = { enabled = false },
      progress = { view = 'notify' },
      -- progress = { enabled = false },

      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },

    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      -- command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
      command_palette = {
        views = {
          cmdline_popup = {
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'FloatBorder' },
            },
            position = {
              row = '50%',
              col = '50%',
            },
            size = {
              min_width = 60,
              width = 'auto',
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 23,
              col = '50%',
            },
            size = {
              width = 60,
              height = 'auto',
              max_height = 15,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'FloatBorder' },
            },
          },
        },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      'rcarriga/nvim-notify',
      opts = {
        render = 'minimal',
        stages = 'slide',
        timeout = 2000,
        fps = 144,
        background_colour = '#000000',
      },
      config = function(_, opts)
        require('notify').setup(opts)
        require('notify').setup {
          on_open = function(win) vim.api.nvim_win_set_config(win, { focusable = false }) end,
        }
      end,
    },
  },
}
