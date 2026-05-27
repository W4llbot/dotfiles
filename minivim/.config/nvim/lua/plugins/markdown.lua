
-- local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	-- group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true

        -- setup plugins only for markdown files
        require('render-markdown').setup {}
        vim.keymap.set('n', '<leader>tm', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Toggle Markdown Preview' })

        ---@diagnostic disable-next-line: missing-fields
        require('image').setup {}
        require ('img-clip').setup {}

        vim.keymap.set('n', '<leader>p', '<cmd>PasteImage<cr>', { desc = 'Paste image from system clipboard' })
	end,
})
