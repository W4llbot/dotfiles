-- DAP configs
local dap = require("dap")

vim.fn.sign_define('DapBreakpoint', { text='🛑' })
vim.fn.sign_define('DapBreakpointCondition', { text='🔍' })
vim.fn.sign_define('DapBreakpointRejected', { text='🚫' })
vim.fn.sign_define('DapLogPoint', { text='📝' })
vim.fn.sign_define('DapStopped', { text='➡️', texthl='', linehl='DapStopped', numhl='' })

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}'
    }
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

-- DAP view and keymaps
require('dap-view').setup {auto_toggle = true,}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F6>', function() require('dap').terminate() end, { desc = 'Debug: Terminate' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dt', '<cmd>DapViewToggle<cr>', { desc = 'Debug: Toggle View' })
vim.keymap.set('n', '<leader>de', function() require('dap.ui.widgets').hover() end, { desc = 'Debug: Eval under cursor' })
