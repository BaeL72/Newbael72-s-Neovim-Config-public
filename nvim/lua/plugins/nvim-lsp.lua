return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = false,
				--[[ ensure_installed = {
					"clangd",
					"rust_analyzer",
					"lua_ls",
					"pyright",
				},
				exclude = {
						"rust_analyzer",
						"cmake",
					}, ]]
			})
		end,
	},
}
