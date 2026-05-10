-- See `:h :packadd`, `:h vim.pack`
vim.cmd('packadd! nohlsearch')
vim.pack.add({
    -- Themes
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/folke/tokyonight.nvim",

    -- LSP stack
    'https://github.com/folke/lazydev.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason-lspconfig.nvim',

    -- DAP stack
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/igorlfs/nvim-dap-view',

    -- Others
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/jiaoshijie/undotree',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require 'plugins.colors'
require 'plugins.lsp'
require 'plugins.dap'
require 'plugins.mini'
require 'plugins.tmux'
require 'plugins.undotree'

require('render-markdown').setup {}
