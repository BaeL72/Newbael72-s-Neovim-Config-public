return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<space>cl",
				block = "<space>cb",
			},
			opleader = {
				line = "<space>cl",
				block = "<space>cb",
			},
		})
	end,
}
