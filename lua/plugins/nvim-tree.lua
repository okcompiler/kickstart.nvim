return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function custom_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      local function vsplit_preview() -- open as vsplit on current node
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
          -- expand or collapse folder
          api.node.open.edit()
        else
          -- open file as vsplit
          api.node.open.vertical()
        end

        -- Finally refocus on tree if it was lost
        api.tree.focus()
      end

      vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', 'o', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
      vim.keymap.set('n', 'v', api.node.open.vertical, opts 'Open: Vertical Split')
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close Directory')
      vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts 'CD')
      vim.keymap.set('n', 'L', vsplit_preview, opts 'Vsplit Preview') -- Open node if it is a folder, else create vsplit of file and keep cursor focus on tree
      vim.keymap.set('n', 'H', api.tree.collapse_all, opts 'Collapse All')
    end

    require('nvim-tree').setup {
      on_attach = custom_on_attach,
      filters = {
        git_ignored = false,
      },
    }
  end,
}
