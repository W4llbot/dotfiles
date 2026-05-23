-- require('catppuccin').setup {
--     flavour = 'mocha',
--     transparent_background = true,
--     float = {
--         transparent = true,
--         solid = true
--     },
-- }

require('tokyonight').setup {
    transparent = true,
    styles = {
        sidebars = 'transparent',
        floats = 'transparent',
    }
}

-- require('gruvbox').setup { transparent_mode = true }

-- require('rose-pine').setup {
    -- styles = { transparency = true }
-- }
vim.cmd.colorscheme('tokyonight')
