return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
      },
    }

    -- Basic debugging keymaps
    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
    vim.keymap.set('n', '<leader>db', dap.step_back, { desc = 'Step back' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Continue' })
    vim.keymap.set('n', '<leader>dC', dap.run_to_cursor, { desc = 'Run to cursor' })
    vim.keymap.set('n', '<leader>dd', dap.disconnect, { desc = 'Disconnect' })
    vim.keymap.set('n', '<leader>dg', dap.session, { desc = 'Get session' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over' })
    vim.keymap.set('n', '<leader>du', dap.step_out, { desc = 'Step out' })
    vim.keymap.set('n', '<leader>dp', dap.pause, { desc = 'Pause' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle REPL' })
    vim.keymap.set('n', '<leader>ds', dap.continue, { desc = 'Start' })
    vim.keymap.set('n', '<leader>dq', dap.close, { desc = 'Quit' })
    vim.keymap.set('n', '<leader>dU', "<cmd>lua require('dapui').toggle({reset = true})<CR>", { desc = 'Toggle UI' })
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Set breakpoint with condition' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      controls = {
        element = 'repl',
        enabled = true,
        icons = {
          pause = '',
          play = '▶',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '',
          disconnect = '⏏',
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        mappings = {
          close = { 'q', '<Esc>' },
        },
        border = 'rounded',
      },
      force_buffers = true,
      icons = {
        collapsed = '',
        current_frame = '',
        expanded = '',
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.33,
            },
            {
              id = 'breakpoints',
              size = 0.17,
            },
            {
              id = 'stacks',
              size = 0.25,
            },
            {
              id = 'watches',
              size = 0.25,
            },
          },
          position = 'right',
          size = 0.33,
        },
        {
          elements = { {
            id = 'repl',
            size = 0.45,
          }, {
            id = 'console',
            size = 0.55,
          } },
          position = 'bottom',
          size = 0.27,
        },
      },
      mappings = {
        edit = 'e',
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't',
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
