-- See `:h :packadd`, `:h vim.pack`
vim.cmd('packadd! nohlsearch')
vim.pack.add({
    -- Themes
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
    { src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight' },
    { src = 'https://github.com/ellisonleao/gruvbox.nvim', name = 'gruvbox' },
    { src = 'https://github.com/rose-pine/neovim', name = 'rose-pine' },

    -- LSP stack
    'https://github.com/folke/lazydev.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason-lspconfig.nvim',

    -- DAP stack
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/igorlfs/nvim-dap-view',

    -- Markdown
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/3rd/image.nvim',

    -- Others
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/jiaoshijie/undotree',
})

require 'plugins.colors'
require 'plugins.lsp'
require 'plugins.dap'
require 'plugins.mini'
require 'plugins.tmux'
require 'plugins.undotree'

require('render-markdown').setup {}
require('image').setup {}
