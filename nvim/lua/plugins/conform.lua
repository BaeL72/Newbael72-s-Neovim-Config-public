return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				python = { "black" },
				lua = { "stylua" },
			},
			format_on_save = {
				time_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
