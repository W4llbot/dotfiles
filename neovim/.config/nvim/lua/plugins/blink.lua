return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		enabled = function()
			-- Disable in prompt buffers (REPL) to prevent the "context" error
			return vim.bo.buftype ~= "prompt" and vim.api.nvim_get_mode().mode ~= "c"
			-- Optional: if you want completion specifically for DAP,
			-- you can add a check for the DAP buffer here
			-- or require("cmp_dap").is_dap_buffer()
		end,
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			menu = {
				auto_show = true,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = {
			enabled = true,
			trigger = {
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true,
				show_on_keyword = true,
			},
			window = {
				show_documentation = true,
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
