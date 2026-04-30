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
