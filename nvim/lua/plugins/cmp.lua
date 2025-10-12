return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "super-tab" },
		appearance = {
			nerd_font_variant = "mono",
			use_nvim_cmp_as_default = false,
			kind_icons = {
				Text = "",
				Method = "",
			},
		},

		menu = {
			auto_show = false,
		},
		signature = { enabled = false },
		completion = {
			documentation = { auto_show = false },
			ghost_text = { enabled = false },
			accept = { auto_brackets = { enabled = false } },
		},
		cmdline = {
			enabled = false,
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
	treesitter_highlighting = true,
}
