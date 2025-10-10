return {
  'tpope/vim-rails',
  config = function()
    -- disable the autocmd that sets the yaml filetype to eruby.yaml
    vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
      pattern = { '*.yml' },
      callback = function()
        vim.bo.filetype = 'yaml'
      end,
    })
  end,
}
