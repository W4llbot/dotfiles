-- =======
-- Editing
-- =======
require('mini.ai').setup {}
require('mini.align').setup{}
require('mini.splitjoin').setup {}
require('mini.comment').setup {}
require('mini.move').setup {}
require('mini.pairs').setup {}

-- Snippets setup
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    -- Load custom file with global snippets first
    gen_loader.from_file('~/.config/nvim/snippets/global.json'),

    -- Load snippets based on current language by reading files from
    -- "snippets/" subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})
MiniSnippets.start_lsp_server()

-- ========
-- Workflow
-- ========
require('mini.completion').setup {}
require('mini.files').setup {}
require('mini.pick').setup {}
require('mini.extra').setup {}
require('mini.sessions').setup {}

-- Pass mini completion capabilities to lsp
vim.lsp.config('*', {capabilities = MiniCompletion.get_lsp_capabilities()})

-- Session keymaps
vim.keymap.set('n', '<leader>ss', MiniSessions.select, { desc = 'Select Session' })
vim.keymap.set('n', '<leader>sD', MiniSessions.delete, { desc = 'Delete current Session' })
vim.keymap.set('n', '<leader>sw', function()
    local name = vim.fn.input("Enter session name: ")
    if name then
        MiniSessions.write(name)
    end
end, { desc = 'create new session' } )

-- File explorer setup
vim.keymap.set('n', '<leader>e', MiniFiles.open, { desc = 'Explore Files' })

-- Picker keymaps
vim.keymap.set('n', '<leader>ff', MiniPick.builtin.files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fc', function()
    MiniPick.builtin.files(nil, { source = { cwd = vim.fn.stdpath('config') } })
end, { desc = 'Find Config' })
vim.keymap.set('n', '<leader>fg', MiniPick.builtin.grep_live, { desc = 'Find Grep' })
vim.keymap.set('n', '<leader>fh', MiniPick.builtin.help, { desc = 'Find Help'})
vim.keymap.set('n', '<leader>fb', MiniPick.builtin.buffers, { desc = 'Find Buffer' })
vim.keymap.set('n', '<leader>ft', MiniExtra.pickers.colorschemes, { desc = 'Find Themes' })
vim.keymap.set('n', '<leader>fi', MiniExtra.pickers.git_files, { desc = 'Find Git files' })
vim.keymap.set('n', '<leader>fd', MiniExtra.pickers.diagnostic, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>fm', MiniExtra.pickers.marks, { desc = 'Find Marks' })
vim.keymap.set('n', '<leader>fl', MiniExtra.pickers.hipatterns, { desc = 'Find Highlights' })
vim.keymap.set('n', '<leader>fs', function()
    MiniExtra.pickers.lsp( { scope = 'document_symbol' })
end, { desc = 'Find document Symbols' })
vim.keymap.set('n', '<leader>fS', function()
    MiniExtra.pickers.lsp( { scope = 'workspace_symbol_live' })
end, { desc = 'Find workspace Symbols' })

-- clue setup
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

        { mode = 'n', keys = '<Leader>f', desc = '+Finders' },
        { mode = 'n', keys = '<Leader>d', desc = '+Debug' },
        { mode = 'n', keys = '<Leader>s', desc = '+Sessions' },
        { mode = 'n', keys = '<Leader>t', desc = '+Toggles' },
    },
})

-- ======
-- Others
-- ======
require('mini.icons').setup {}
require('mini.cursorword').setup {}
require('mini.icons').setup {}
require('mini.diff').setup {}
require('mini.hipatterns').setup {}
require('mini.indentscope').setup {}
require('mini.trailspace').setup {}
require('mini.statusline').setup {}

-- start screen setup
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

