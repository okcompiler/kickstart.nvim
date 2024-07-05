--[[
  Use `:help lua-guide` as a
  reference for how Neovim integrates Lua.
  - :help lua-guide
  - (or HTML version): https://neovim.io/doc/user/lua-guide.html

  Use "<space>sh" to [s]earch the [h]elp documentation,
  which is very useful when you're not exactly sure of what you're looking for.

   NOTE: Look for lines like this

  If you experience any errors, run `:checkhealth` for more info.
--]]

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Basic Autocommands ]]
require 'autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Load plugins ]]
require('lazy').setup 'plugins'

-- [[ Load custom commands ]]
local commands = require 'commands'
commands.load(commands.defaults)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
