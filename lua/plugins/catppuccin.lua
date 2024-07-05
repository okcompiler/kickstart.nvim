return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
      integrations = {
        mini = {
          enabled = true,
          indentscope_color = '',
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
