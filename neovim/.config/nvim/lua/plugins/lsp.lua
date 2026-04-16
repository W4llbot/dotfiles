return {
        "neovim/nvim-lspconfig",
        dependencies = {
                { "williamboman/mason.nvim", config = true }, -- Mason must run before lspconfig
                "williamboman/mason-lspconfig.nvim",
                "saghen/blink.cmp", -- Dependency to ensure capabilities are available
        },
        config = function()
                local lspconfig = require("lspconfig")
                local mason_lspconfig = require("mason-lspconfig")

                -- Get blink.cmp capabilities to pass to LSP servers
                local capabilities = require('blink.cmp').get_lsp_capabilities()

                mason_lspconfig.setup({
                        ensure_installed = {
                                "lua_ls",
                                "ts_ls",
                                "clangd",
                                "pyright",
                                "gopls",
                                "bashls",
                                "html",
                                "cssls",
                                "jsonls",
                        }, -- Add your servers here
                        handlers = {
                                -- Default handler for installed servers
                                function(server_name)
                                        lspconfig[server_name].setup({
                                                capabilities = capabilities,
                                        })
                                end,
                                -- Dedicated handlers for specific servers (optional)
                                -- ["lua_ls"] = function()
                                --         lspconfig.lua_ls.setup({
                                --                 capabilities = capabilities,
                                --                 settings = { Lua = { diagnostics = { globals = { "vim" } } } }
                                --         })
                                -- end,
                        },
                })

                vim.diagnostic.config({
                    virtual_text = true, -- Disable the default end-of-line text
                    virtual_lines = false, -- Enable diagnostics on their own lines
                })

                -- vim.keymap.set('n', '<leader>t', function()
                --     vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                -- end, { desc = 'Toggle lsp diagnostics' })

                vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show diagnostics in float" })

                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "c", "cpp" },
                    callback = function()
                        vim.keymap.set("n", "<leader>gh", "<cmd>LspClangdSwitchSourceHeader<CR>", { buffer = true, desc = "Go to Header/Source" })
                    end,
                })
        end,

}
