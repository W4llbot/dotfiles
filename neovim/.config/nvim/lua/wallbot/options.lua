vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- neovim only takes the last option
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- cindent config
vim.opt.cinoptions = ":0,l1,g0,(0,m1"

-- vim.opt.iskeyword:remove({ '_' })
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.fillchars = { eob = " " }

local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == false then vim.fn.mkdir(undodir) end

vim.opt.undofile = true
vim.opt.autoread = true

vim.opt.backspace = "indent,eol,start"

vim.o.winborder = "rounded"

-- vim.diagnostic.config({
--         virtual_lines = true, -- Shows diagnostics on new lines below the code
--         virtual_text = false,  -- Usually best to disable virtual_text if using lines
-- })

