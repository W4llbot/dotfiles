require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

local TSLanguages = {
    'rust',
    'javascript',
    'zig',
    'lua',
    'vim',
    'c',
    'cpp',
    'c_sharp',
    'python',
    'json',
    'glsl',
    'markdown',
    'markdown_inline',
    'comment',
    'html',
    'latex',
    'typst',
    'yaml',
    'json',
}

require('nvim-treesitter').install(TSLanguages)

vim.api.nvim_create_autocmd('FileType', {
    pattern = TSLanguages,
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

require("luasnip.loaders.from_vscode").lazy_load()

-- local ls = require("luasnip")
-- vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})

require('blink.cmp').setup {
    keymap = { preset = 'default' },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = true }
    },
    signature = { enabled = true },
    snippets = { preset = 'luasnip' },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
}

-- Make current param for function signature help more visible
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { link = "Search" })

-- Pass blink.cmp capabilities to lsp
vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })
