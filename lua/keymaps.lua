-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search highlights by pressing <leader>h
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'No highlight' })

-- Write buffer with <leader>w
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save' })

-- Quit with <leader>q
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<CR>', { desc = 'Quit' })

-- Close buffer with <leader>c
vim.keymap.set('n', '<leader>c', '<cmd>BufferKill<CR>', { desc = 'Close Buffer' })

-- Go to Alpha screen
vim.keymap.set('n', '<leader>;', '<cmd>Alpha<CR>', { desc = 'Alpha' })

-- Toggle NvimTree Explorer
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = '[E]xplorer' })

-- Using 0 goes to the first non-whitespace character on the line
vim.keymap.set('n', '0', '^')
vim.keymap.set('n', '^', '0')

-- Exit insert mode with jk
vim.keymap.set('i', 'jk', '<Esc>')

-- Open vertical split with vv
vim.keymap.set('n', 'vv', '<C-w>v')

-- Reload LuaSnip and snippets without having to restart
vim.keymap.set('n', '<leader><leader>s', '<cmd>Lazy reload LuaSnip<CR>')

-- Buffer keymaps
vim.keymap.set('n', '<leader>bj', '<cmd>BufferLinePick<CR>', { desc = 'Jump' })
vim.keymap.set('n', '<leader>bf', '<cmd>Telescope buffers previewer=true<CR>', { desc = 'Find' })
vim.keymap.set('n', '<leader>bb', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous' })
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next' })
vim.keymap.set('n', '<leader>bW', '<cmd>noautocmd w<CR>', { desc = 'Save without formatting (noautocmd)' })
vim.keymap.set('n', '<leader>be', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick which buffer to close' })
vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close all to the left' })
vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close all to the right' })
vim.keymap.set('n', '<leader>bD', '<cmd>BufferLineSortByDirectory<CR>', { desc = 'Sort by directory' })
vim.keymap.set('n', '<leader>bL', '<cmd>BufferLineSortByExtension<CR>', { desc = 'Sort by language' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- TODO: Set-up which-key for these two mappings to mimic LunarVim
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Plugins keymaps
vim.keymap.set('n', '<leader>ph', '<cmd>Lazy home<CR>', { desc = '[H]ome' })
vim.keymap.set('n', '<leader>pi', '<cmd>Lazy install<CR>', { desc = '[I]nstall' })

-- Treesitter keymaps
vim.keymap.set('n', '<leader>Tc', '<cmd>TSConfigInfo<CR>', { desc = '[C]onfig info' })
vim.keymap.set('n', '<leader>Ti', '<cmd>TSInstallInfo<CR>', { desc = '[I]nstall info' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim: ts=2 sts=2 sw=2 et
