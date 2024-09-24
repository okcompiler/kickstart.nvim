-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      icons = {
        mappings = false,
      },
      filter = function(mapping)
        -- Exclude mappings without a description
        return mapping.desc and mapping.desc ~= ''
      end,
    }

    -- Document existing key chains
    require('which-key').add {
      { '<leader>b', group = 'Buffers' },
      { '<leader>b_', hidden = true },
      { '<leader>d', group = 'Debug' },
      { '<leader>d_', hidden = true },
      { '<leader>i', group = 'Inlay' },
      { '<leader>i_', hidden = true },
      { '<leader>l', group = 'LSP' },
      { '<leader>l_', hidden = true },
      { '<leader>p', group = 'Plugins' },
      { '<leader>p_', hidden = true },
      { '<leader>r', group = 'Rename' },
      { '<leader>r_', hidden = true },
      { '<leader>s', group = 'Search' },
      { '<leader>s_', hidden = true },
      { '<leader>t', group = 'Test' },
      { '<leader>t_', hidden = true },
      { '<leader>T', group = 'Treesitter' },
      { '<leader>T_', hidden = true },
      { '<leader>v', group = 'Vimux' },
      { '<leader>v_', hidden = true },
      { '<leader>vg', group = 'Go' },
      { '<leader>vg_', hidden = true },
      { '<leader>W', group = 'Workspace' },
      { '<leader>W_', hidden = true },
      -- TODO: This was replaced with clear search highlights
      -- { '<leader>h', group = 'Git hunk' },
      -- { '<leader>h_', hidden = true },

      -- visual mode
      -- {
      --   mode = { 'v' },
      --   { '<leader>h', group = 'Git hunk' },
      --   { '<leader>h_', hidden = true },
      -- },
    }
  end,
}
