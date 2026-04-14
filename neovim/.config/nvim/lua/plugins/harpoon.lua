return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()

		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add current buffer to Harpoon" })
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)

		vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end)

		vim.keymap.set("n", "<leader>fl", function()
			local conf = require("telescope.config").values
			local themes = require("telescope.themes")
			local file_paths = {}
			for _, item in ipairs(harpoon:list().items) do
				table.insert(file_paths, item.value)
			end
			require("telescope.pickers").new(themes.get_ivy({ prompt_title = "Working List" }), {
				finder = require("telescope.finders").new_table({ results = file_paths }),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end, { desc = "Open harpoon window" })
	end
}

