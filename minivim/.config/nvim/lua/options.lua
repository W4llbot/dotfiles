vim.g.mapleader       = ' '
vim.g.maplocalleader  = ' '

vim.o.number          = true
vim.o.relativenumber  = true
vim.o.cursorline      = true
vim.o.scrolloff       = 10
vim.opt.sidescrolloff = 10
vim.o.signcolumn      = 'yes'
vim.o.colorcolumn     = '80'

vim.o.ignorecase      = true
vim.o.smartcase       = true
vim.o.shiftwidth      = 4
vim.o.tabstop         = 4
vim.o.expandtab       = true
vim.opt.wrap          = false
vim.opt.linebreak     = false
vim.opt.breakindent   = false

-- neovim only takes the last option
vim.opt.expandtab     = true
vim.opt.autoindent    = true
vim.opt.smartindent   = true
vim.opt.cindent       = true
vim.opt.cinoptions    = ':0,l1,g0,(0,m1' -- cindent config

-- search opts
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.hlsearch      = true
vim.opt.incsearch     = true

vim.o.confirm         = true
vim.o.mouse           = 'a'
vim.opt.undofile      = true
vim.opt.autoread      = true
vim.opt.backspace     = 'indent,eol,start'
vim.o.winborder       = 'rounded'
vim.o.completeopt     = 'fuzzy,menu,menuone,noinsert'
