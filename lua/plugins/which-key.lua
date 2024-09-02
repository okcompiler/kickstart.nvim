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
      ignore_missing = true, -- Ignore missing keymaps
    }

    -- Document existing key chains
    require('which-key').register {
      ['<leader>b'] = { name = 'Buffers', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = 'Debug', _ = 'which_key_ignore' },
      ['<leader>i'] = { name = 'Inlay', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = 'LSP', _ = 'which_key_ignore' },
      ['<leader>p'] = { name = 'Plugins', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = 'Rename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = 'Test', _ = 'which_key_ignore' },
      ['<leader>T'] = { name = 'Treesitter', _ = 'which_key_ignore' },
      ['<leader>v'] = {
        name = 'Vimux',
        _ = 'which_key_ignore',
        g = {
          name = 'Go',
          _ = 'which_key_ignore',
        },
      },
      ['<leader>W'] = { name = 'Workspace', _ = 'which_key_ignore' },
      -- TODO: This was replaced with clear search highlights
      -- ['<leader>h'] = { name = 'Git hunk', _ = 'which_key_ignore' },
    }
    -- visual mode
    -- require('which-key').register({
    --   ['<leader>h'] = { 'Git hunk' },
    -- }, { mode = 'v' })
  end,
}
