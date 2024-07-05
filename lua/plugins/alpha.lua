return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      '                                                     ',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
      '                                                     ',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('f', '󰈞' .. '  Find File', '<CMD>Telescope find_files<CR>'),
      dashboard.button('n', '' .. '  New File', '<CMD>ene!<CR>'),
      dashboard.button('r', '' .. '  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('t', '󰊄' .. '  Find Text', '<CMD>Telescope live_grep<CR>'),
      dashboard.button('c', '' .. '  Configuration', '<cmd>e $MYVIMRC<CR>'),
      dashboard.button('q', '󰅖' .. '  Quit', '<cmd>quit<CR>'),
    }

    vim.b.miniindentscope_disable = true

    alpha.setup(dashboard.opts)

    local alphagroup = vim.api.nvim_create_augroup('alphagroup', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Disable folding on alpha buffer',
      pattern = 'alpha',
      group = alphagroup,
      command = 'setlocal nofoldenable',
    })

    vim.api.nvim_create_autocmd('Filetype', {
      desc = 'Disable mini indentscope',
      pattern = 'alpha',
      group = alphagroup,
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
