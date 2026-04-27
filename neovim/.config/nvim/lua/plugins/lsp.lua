return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mfussenegger/nvim-lint",
		"stevearc/conform.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		-- Get blink.cmp capabilities to pass to LSP servers
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"clangd",
				"pyright",
				"bashls",
				"html",
				"cssls",
				"jsonls",
			},
			handlers = {
				-- Default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true, -- Disable the default end-of-line text
			virtual_lines = false, -- Enable diagnostics on their own lines
		})

		vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show diagnostics in float" })

		-- c specific go to header
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "c", "cpp" },
			callback = function()
				vim.keymap.set(
					"n",
					"<leader>gh",
					"<cmd>LspClangdSwitchSourceHeader<CR>",
					{ buffer = true, desc = "Go to Header/Source" }
				)
			end,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"black",
				"clang-format",
				"prettier",
			},
			integrations = {
				["mason-lspconfig"] = true,
				["mason-nvim-dap"] = true,
			},
		})

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
			},
			formatters = {
				["clang-format"] = {
					-- manually set clang-format style
					prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4}" },
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
