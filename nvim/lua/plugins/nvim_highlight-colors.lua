return {
	"brenoprata10/nvim-highlight-colors",
	ft = { "toml", "css", "conf", "config" }, -- Only load for these filetypes
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background",
			enable_named_colors = true,
			enable_tailwind = false,
		})
	end,
}
