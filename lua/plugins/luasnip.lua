return {
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
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  config = function()
    local ls = require 'luasnip'
    -- local types = require 'luasnip.util.types'

    ls.setup {
      update_events = { 'TextChanged', 'TextChangedI' },
      ext_opts = {
        -- [types.choiceNode] = {
        --   active = {
        --     virt_text = { { '<--', 'Error' } },
        --   },
        -- },
      },
    }

    -- Load lua snippets from path/of/your/nvim/config/luasnippets
    require('luasnip.loaders.from_lua').lazy_load()

    -- Load VS-Code-like snippets from path/of/your/nvim/config/snippets
    require('luasnip.loaders.from_vscode').lazy_load { paths = { './snippets' } }
  end,
}
