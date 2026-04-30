require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

local TSLanguages = {
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

require("nvim-treesitter").install { TSLanguages }
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
