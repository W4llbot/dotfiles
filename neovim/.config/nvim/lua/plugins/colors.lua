local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "none", fg = "none"})
end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
        opts = {},
		config = function()
            vim.o.background = "dark"
			vim.cmd.colorscheme("catppuccin-mocha")
			enable_transparency()
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"-tree/nvim-web-devicons",
		},
                config = function()
                        require("lualine").setup({
                                options = { theme = "auto" }
                        });
                end,
	}
}
