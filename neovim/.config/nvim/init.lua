--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

local parser_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/site")
vim.opt.runtimepath:prepend(parser_path)

require("wallbot")

--vim.lsp.enable({
--	"clangd",
--	"pyright",
--	"lua_ls"
--})

vim.diagnostic.config({
    virtual_text = true,
    -- other options like signs, update_in_insert, etc.
})
