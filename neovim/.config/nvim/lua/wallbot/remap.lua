vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save with leader+w
vim.keymap.set("n", "<Leader>w", ":w<CR>", { desc = "Write to current buffer" } )

-- Better window navigation
vim.keymap.set({"n", "t"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n", "t"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n", "t"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n", "t"}, "<C-l>", "<C-w>l")


-- quickly enter netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer" })

-- quickly exit terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Raylib specific compile
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("w")

    vim.cmd("make && .\\bin\\Debug\\01-Pong.exe")
end, { desc = "Build and run Raylib project" })

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

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

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
