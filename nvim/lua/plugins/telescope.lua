return {
	"nvim-telescope/telescope-file-browser.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				initial_mode = "normal",
				mappings = {
					n = {
						["q"] = require("telescope.actions").close,
					},
				},
			},
			extensions = {
				file_browser = {
					git_status = true,
					hijack_netrw = true,
				},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
