local parser_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/site")

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        install_dir = parser_path,
        indent = { enabled = false },
    },
    config = function()
        require("nvim-treesitter").install {
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
    end
}
