vim.api.nvim_create_user_command("TelescopeConfig", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Find files in Neovim config directory" })

return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "TS: find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "TS: live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "TS: buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "TS: help tags" })
		vim.keymap.set("n", "<leader>fi", builtin.git_files, { desc = "TS: git files" })
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "TS: references" })
		vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "TS: workspace symbols" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "TS: document symbols" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "TS: diagnostics" })

		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Telescope find config files" })

		-- require('telescope').setup({
		--     pickers = {
		--         find_files = {
		--             hidden = true,
		--             -- optional: disable .gitignore matching
		--             -- no_ignore = true,
		--         }
		--     }
		-- })
	end,
}
