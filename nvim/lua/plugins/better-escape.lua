return {
	"max397574/better-escape.nvim",
	config = function()
		require("better_escape").setup({
			timeout = vim.o.timeoutlen,
			default_mappings = false,
			mappings = {
				i = {
					j = {
						j = "<Esc>",
					},
				},
				t = {
					j = {
						j = "<C-\\><C-n>",
					},
				},
				c = {
					j = {
						j = "<C-c>",
					},
				},
				s = {
					j = {
						j = "<Esc>",
					},
				},
			},
		})
	end,
}
