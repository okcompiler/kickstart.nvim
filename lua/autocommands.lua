-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Re-format markdown to wrap to 80 characters. Select the lines to format (using v or V, etc.), then re-format it with gq',
  pattern = '*.md',
  command = 'setlocal textwidth=80',
})

vim.api.nvim_create_augroup('go_settings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set tab spacing for Go files to 4 spaces',
  pattern = 'go',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
  group = 'go_settings',
})

-- vim: ts=2 sts=2 sw=2 et
