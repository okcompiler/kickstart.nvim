return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local opts = {
      enabled = true,
      scope = { show_exact_scope = true },
      exclude = {
        filetypes = {
          'alpha',
          'help',
          'startify',
          'dashboard',
          'lazy',
          'neogitstatus',
          'NvimTree',
          'Trouble',
          'text',
        },
        buftypes = { 'terminal', 'nofile', 'alpha' },
      },
      indent = {
        char = '▏',
        tab_char = ' ',
      },
    }

    require('ibl').setup(opts)
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
  end,
}
