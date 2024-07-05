return {
  'folke/noice.nvim',
  config = function()
    require('noice').setup {
      messages = {
        enabled = false,
        view = 'notify',
        view_history = 'messages',
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    }
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
