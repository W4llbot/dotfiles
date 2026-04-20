return {
    {
        "igorlfs/nvim-dap-view",
        lazy = false,
        version = "1.*",
        ---@module "dap-view"
        ---@type dapview.Config
        opts = {
            winbar = {
                -- controls = { enabled = true }
            },
            windows = {
                size = 0.5,
                position = "right",
                terminal = {
                    size = 0.5,
                    position = "below",
                },
            },
            auto_toggle = true,
        }
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "igorlfs/nvim-dap-view",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")

            require("mason-nvim-dap").setup( {
                ensure_installed = { "codelldb" },
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,
                },
                automatic_installation = true,
            } );
            require("nvim-dap-virtual-text").setup({})

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                    args = {"--port", "${port}"},
                }
            }

            dap.configurations.c = {
                {
                    name = "Launch File",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        -- return "${workspaceFolder}/bin/Debug/01-Pong.exe"
                    end,
                    args = {},
                    cwd = "${workspaceFolder}",
                    stopAtEntry = false,
                    stopAtBeginningOfMainSubprogram = false,
                    -- MIMode = "codelldb",
                },
            }

            dap.configurations.cpp = dap.configurations.c

            -- Essential Debugging Control
            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
            vim.keymap.set("n", "<F6>", dap.terminate, { desc = "Debug: Terminate Session" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

            -- Breakpoint Management
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>B", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Debug: Set Conditional Breakpoint" })

            -- UI and Session Management
            -- vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
            vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate Session" })
            vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Debug: Toggle REPL" })
        end
    }
}
