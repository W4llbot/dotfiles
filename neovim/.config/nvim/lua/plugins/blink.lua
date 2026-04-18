-- Has to be here! Blink stops working when "config" function is used
vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpActiveParameter', { link = 'Search' })

return {
    "saghen/blink.cmp",
    version = "1.*", -- Use a release tag to download pre-built binaries
    opts = {
        enabled = function()
            -- Disable in prompt buffers (REPL) to prevent the "context" error
            return vim.bo.buftype ~= "prompt"
            and vim.api.nvim_get_mode().mode ~= 'c'
            -- Optional: if you want completion specifically for DAP, 
            -- you can add a check for the DAP buffer here
            -- or require("cmp_dap").is_dap_buffer()
        end,
        keymap = { preset = 'default' }, -- Sets default keymaps for completion
        appearance = {
            use_nvim_cmp_as_default = true, -- Fallback for icons/highlights
            nerd_font_variant = 'mono'
        },
        completion = {
            menu = {
                auto_show = true
            },
            documentation = {
                auto_show = true,          -- Show documentation for the selected item automatically
                --auto_show_delay_ms = 200,   -- Delay before showing the window
            },
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        signature = {
            enabled = true,
            trigger = {
                show_on_trigger_character = true,
                show_on_insert_on_trigger_character = true,
                show_on_keyword = true,
            },
            window = {
                show_documentation = true,
            }
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
