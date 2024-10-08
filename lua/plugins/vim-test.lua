return {
  'vim-test/vim-test',
  config = function()
    -- Set vim-test options
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#neovim#term_position'] = 'vert'
    vim.g['test#ruby#use_binstubs'] = 0
    vim.g['test#go#gotest#options'] = '-v'

    -- Testing keymaps
    vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<CR>', { desc = 'Test nearest to cursor' })
    vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<CR>', { desc = 'Test current file' })
    vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<CR>', { desc = 'Test entire suite' })
    vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<CR>', { desc = 'Test last one again' })
    vim.keymap.set('n', '<leader>tv', '<cmd>TestVisit<CR>', { desc = 'Test visit file' })
  end,
}
