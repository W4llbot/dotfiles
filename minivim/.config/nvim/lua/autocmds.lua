-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
vim.api.nvim_create_autocmd('UIEnter', {
    callback = function()
        vim.o.clipboard = 'unnamedplus'
    end,
})

-- local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	-- group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
