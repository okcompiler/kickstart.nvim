return {
  'vim-test/vim-test',
  config = function()
    -- Set vim-test options
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#neovim#term_position'] = 'vert'
    vim.g['test#ruby#use_binstubs'] = 0
    vim.g['test#go#gotest#options'] = '-v'

    -- Testing keymaps
    vim.keymap.set('n', '<leader>tn', '<cmd>TestNearest<CR>', { desc = '[T]est [N]earest to cursor' })
    vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<CR>', { desc = '[T]est current [F]ile' })
    vim.keymap.set('n', '<leader>ts', '<cmd>TestSuite<CR>', { desc = '[T]est entire [S]uite' })
    vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<CR>', { desc = '[T]est [L]ast one again' })
    vim.keymap.set('n', '<leader>tv', '<cmd>TestVisit<CR>', { desc = '[T]est [V]isit file' })
  end,
}
