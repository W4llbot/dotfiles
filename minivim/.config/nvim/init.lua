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
vim.o.completeopt     = 'menu,menuone,noinsert'

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
vim.api.nvim_create_autocmd('UIEnter', {
    callback = function()
        vim.o.clipboard = 'unnamedplus'
    end,
})

-- KEYMAPS
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Raylib specific compile
vim.keymap.set("n", "<leader>r", function()
	vim.cmd("w")
	vim.cmd("make && .\\bin\\Debug\\01-Pong.exe")
end, { desc = "Build and run Raylib project" })

vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- AUTOCOMMANDS
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

-- PLUGINS
-- See `:h :packadd`, `:h vim.pack`
vim.cmd('packadd! nohlsearch')
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    'https://github.com/folke/lazydev.nvim',

    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason-lspconfig.nvim',

    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/igorlfs/nvim-dap-view',

    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/christoomey/vim-tmux-navigator'
})

-- Editor visuals
require('catppuccin').setup {
    flavour = 'mocha',
    transparent_background = true,
    float = {
        transparent = true,
        solid = true
    },
}
vim.cmd.colorscheme('catppuccin')

-- DAP setup
local dap = require("dap")
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
local dap = require("dap")
dap.configurations.c = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}'
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}'
    }
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

require('dap-view').setup {auto_toggle = true,}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F6>', function() require('dap').terminate() end, { desc = 'Debug: Terminate' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dt', '<cmd>DapViewToggle<cr>', { desc = 'Debug: Toggle View' })
vim.keymap.set('n', '<leader>de', function() require('dap.ui.widgets').hover() end, { desc = 'Debug: Eval under cursor' })

-- LSP setup
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
local languages = {
    "rust",
    "javascript",
    "zig",
    "lua",
    "vim",
    "c",
    "cpp",
    "c_sharp",
    "python",
    "json",
    "glsl",
    "markdown",
    "markdown_inline",
    "comment",
    "html",
    "latex",
    "typst",
    "yaml",
}
require("nvim-treesitter").install { languages }
vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function()
        -- enable highlighting
        vim.treesitter.start()

        -- enable folding
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'
        vim.wo[0][0].foldmethod = 'indent'
        vim.wo[0][0].foldlevel = 99
    end,
})

require('lazydev').setup {}
require('mason').setup {}
require('mason-lspconfig').setup {
    ensure_installed = {
        'lua_ls',
        'ts_ls',
        'pyright',
        'html',
        'cssls',
        'jsonls',
        'bashls',
        'clangd',
        'marksman'
    },
}
vim.diagnostic.config({
    virtual_text = true,
})

-- Mini modules setup
require('mini.ai').setup {}
require('mini.align').setup{}
require('mini.splitjoin').setup {}
require('mini.comment').setup {}
require('mini.move').setup {}
require('mini.pairs').setup {}
require('mini.icons').setup {}
require('mini.completion').setup {}
require('mini.files').setup {}
require('mini.pick').setup {}
require('mini.extra').setup {}
require('mini.sessions').setup {}
require('mini.cursorword').setup {}
require('mini.icons').setup {}
require('mini.diff').setup {}
require('mini.hipatterns').setup {}
require('mini.indentscope').setup {}
require('mini.trailspace').setup {}
require('mini.statusline').setup {}

vim.keymap.set('n', '<leader>sw', function()
    local name = vim.fn.input("Enter session name: ")
    if name then
        MiniSessions.write(name)
    end
end, { desc = 'create new session' } )

vim.keymap.set('n', '<leader>e', MiniFiles.open, { desc = 'Open mini.files' })
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fc', function()
    MiniPick.builtin.files({ source = { cwd = vim.fn.stdpath('config') } })
end, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help, { desc = 'Find Help'})
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Find Buffer' })
vim.keymap.set('n', '<leader>ft', MiniExtra.pickers.colorschemes, { desc = 'Find Themes' })
vim.keymap.set('n', '<leader>fd', MiniExtra.pickers.diagnostic, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>fm', MiniExtra.pickers.marks, { desc = 'Find Marks' })
vim.keymap.set('n', '<leader>fi', MiniExtra.pickers.hipatterns, { desc = 'Find Highlights' })
vim.keymap.set('n', '<leader>fs', function()
    MiniExtra.pickers.lsp( { scope = 'document_symbol' })
end, { desc = 'Find document Symbols' })
vim.keymap.set('n', '<leader>fS', function()
    MiniExtra.pickers.lsp( { scope = 'workspace_symbol_live' })
end, { desc = 'Find workspace Symbols' })

local starter = require('mini.starter')
starter.setup({
    header = [[
█▄ █ ██▀ ▄▀▀▄ █ █ █ █▄ ▄█
█ ▀█ █▄▄ ▀▄▄▀ ▀▄▀ █ █ ▀ █
    ]],
    footer = '',
    sections = {
        starter.sections.sessions();
        starter.sections.recent_files(5, false, true),
        starter.sections.builtin_actions(),
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning('center', 'center'),
    },
})

require("mini.surround").setup({
    mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
    },
})

local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },
    { mode = 'i', keys = '<C-x>' },
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    { mode = 'n', keys = '<C-w>' },
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  clues = {
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

-- TMUX nav
vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>")
