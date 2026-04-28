return {
	"nvim-mini/mini.nvim",
	version = false,
	opts = { a = "1", b = "2", c = "3" },
	config = function()
		-- editing
		require("mini.ai").setup()
		require("mini.align").setup()
		require("mini.comment").setup()
		require("mini.splitjoin").setup()
		require("mini.pairs").setup()

		---@table MiniSurround.config
		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})

		-- visuals
		require("mini.cursorword").setup()
		require("mini.icons").setup()
		require("mini.hipatterns").setup()
		-- require('mini.notify').setup()
		require("mini.indentscope").setup()
		require("mini.trailspace").setup()
	end,
}
