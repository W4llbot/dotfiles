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
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },
    { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range ('v2.*') },
    'https://github.com/rafamadriz/friendly-snippets',


    -- DAP stack
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/igorlfs/nvim-dap-view',
    'https://github.com/thehamsta/nvim-dap-virtual-text',


    -- Markdown
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/3rd/image.nvim',
    'https://github.com/hakonharnes/img-clip.nvim',
    'https://github.com/iamcco/markdown-preview.nvim',


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
require 'plugins.markdown'
