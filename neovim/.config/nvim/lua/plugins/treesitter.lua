local parser_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/site")

---@module "lazy"
---@type "lazySpec"
return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        install_dir = parser_path,
        indent = { enabled = false },
    },
    config = function()
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
    end
}
