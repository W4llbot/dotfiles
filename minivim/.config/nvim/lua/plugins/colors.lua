require('catppuccin').setup {
    flavour = 'mocha',
    transparent_background = true,
    float = {
        transparent = true,
        solid = true
    },
}

require('tokyonight').setup { transparent = true }


vim.cmd.colorscheme('tokyonight')
