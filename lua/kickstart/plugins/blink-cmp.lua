return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load {
                paths = { './lua/snippets/' },
              }
            end,
          },
          'benfowler/telescope-luasnip.nvim',
        },
        opts = {},
        config = function(_, opts)
          if opts then
            require('luasnip').config.setup(opts)
          end
          vim.tbl_map(function(type) require('luasnip.loaders.from_' .. type).lazy_load() end, { 'vscode', 'snipmate', 'lua' })
          -- friendly-snippets - enable standardized comments snippets
          require('luasnip').filetype_extend('typescript', { 'tsdoc' })
          require('luasnip').filetype_extend('javascript', { 'jsdoc' })
          require('luasnip').filetype_extend('lua', { 'luadoc' })
          require('luasnip').filetype_extend('python', { 'pydoc' })
          require('luasnip').filetype_extend('rust', { 'rustdoc' })
          require('luasnip').filetype_extend('cs', { 'csharpdoc' })
          require('luasnip').filetype_extend('java', { 'javadoc' })
          require('luasnip').filetype_extend('c', { 'cdoc' })
          require('luasnip').filetype_extend('cpp', { 'cppdoc' })
          require('luasnip').filetype_extend('php', { 'phpdoc' })
          require('luasnip').filetype_extend('kotlin', { 'kdoc' })
          require('luasnip').filetype_extend('ruby', { 'rdoc' })
          require('luasnip').filetype_extend('sh', { 'shelldoc' })
        end,
      },

      'folke/lazydev.nvim',
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',
        ['<C-k>'] = {},
        ['<C-y>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            end
            if cmp.is_menu_visible() or vim.fn.pumvisible() == 1 then
              vim.cmd 'let &undolevels = &undolevels'
            end
            return cmp.select_and_accept()
          end,
          'fallback',
        },

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- ghost_text = {
        --   enabled = true,
        -- },
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        list = { selection = { preselect = true, auto_insert = false } },
        documentation = {
          window = {
            border = 'rounded',
            -- winblend = 0,
          },
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        menu = {
          border = 'rounded',
          -- winblend = 0
          draw = {
            columns = {
              { 'label', 'label_description', 'source_name', gap = 1 },
              { 'kind_icon', 'kind' },
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  if ctx.source_id == 'cmdline' then
                    return
                  end
                  return ctx.kind_icon .. ctx.icon_gap
                end,
              },
              source_name = {
                text = function(ctx)
                  if ctx.source_id == 'cmdline' then
                    return
                  end
                  return ctx.source_name:sub(1, 4)
                end,
              },
            },
            -- for highlighting in completion menu
            treesitter = {
              'lsp',
            },
          },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          buffer = {
            -- Make buffer compeletions appear at the end.
            score_offset = -100,
            enabled = function()
              -- Filetypes for which buffer completions are enabled; add filetypes to extend:
              local enabled_filetypes = {
                'markdown',
                'text',
              }
              local filetype = vim.bo.filetype
              return vim.tbl_contains(enabled_filetypes, filetype)
            end,
          },
          -- On WSL2, blink.cmp may cause the editor to freeze due to a known limitation.
          -- To address this issue, uncomment the following configuration:
          -- cmdline = {
          --   enabled = function()
          --     return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match "^[%%0-9,'<>%-]*!"
          --   end,
          -- },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },

      -- Shows a signature help window while you type arguments for a function
      signature = {
        window = {
          border = 'rounded',
          -- winblend = 0
        },
        enabled = true,
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
