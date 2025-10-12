return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	config = function()
		vim.g.rustaceanvim = {
			server = {
				settings = {
					["rust-analyzer"] = {
						check = {
							checkOnSave = false,
							command = "check",
						},
						checkOnSave = {
							enable = true,
							command = "clippy",
						},
						diagnostics = {
							enable = true,
						},
						inlayHints = {
							typeHints = { enable = true },
						},
					},
				},
			},
			dap = {},
		}
	end,
}
