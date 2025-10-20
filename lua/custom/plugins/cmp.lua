return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
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
          config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
  },

  config = function()
    local cmp = require 'cmp'
    local util_cmp = require 'custom.util.cmp'

    -- Register LSP capabilities
    -- vim.lsp.config('*', { capabilities = require('cmp_nvim_lsp').default_capabilities() })

    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

    local defaults = require 'cmp.config.default'()
    local auto_select = true
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    cmp.setup {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      luasnip.config.setup {},
      auto_brackets = {}, -- configure any filetype to auto add brackets
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<C-Space>'] = cmp.mapping.complete(),

        -- ✅ Use our own confirm
        ['<CR>'] = util_cmp.confirm { select = auto_select },
        ['<C-y>'] = util_cmp.confirm { select = true },
        ['<S-CR>'] = util_cmp.confirm { behavior = cmp.ConfirmBehavior.Replace },

        ['<C-CR>'] = function(fallback)
          cmp.abort()
          fallback()
        end,

        ['<Tab>'] = function(fallback)
          return fallback() -- hoặc map riêng nếu bạn có snippet forward
        end,
      },

      -- sources = cmp.config.sources({
      --   { name = 'nvim_lsp' },
      --   { name = 'path' },
      -- }, {
      --   { name = 'buffer' },
      -- }),

      -- experimental = {
      --   ghost_text = {
      --     hl_group = 'CmpGhostText',
      --   },
      -- },

      sorting = defaults.sorting,
      sources = {
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      },
    }
  end,
}
