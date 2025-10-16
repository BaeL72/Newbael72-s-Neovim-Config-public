local icons = {
	ERROR = "  ", -- A common error icon
	WARN = "  ", -- A common warning icon
	INFO = "  ", -- An info icon
	HINT = "  ", -- A hint icon
}

local severities = vim.diagnostic.severity

local colors = {
	RED = "#ff0000",
	YELLOW = "#eed202",
	GREEN = "#32cd32",
	BLUE = "#1e90ff",
}
-- Define the highlight groups for the signs in the gutter.
-- You can change the colors here to match your colorscheme.
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = colors.RED, bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = colors.YELLOW, bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = colors.GREEN, bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = colors.BLUE, bg = "none" })

-- Define highlight groups for the virtual text.
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.RED })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.YELLOW })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.GREEN })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.BLUE })

-- Configure the built-in diagnostic system.
vim.diagnostic.config({
	-- Sort diagnostics by severity, which affects virtual text and float windows.
	severity_sort = true,
	-- Show signs in the gutter.
	signs = {
		active = true,
		-- The values table defines the text and highlight for each severity.
		-- Priority is automatically handled by the severity number.
		values = {
			[severities.ERROR] = { text = icons.ERROR, texthl = "DiagnosticSignError" },
			[severities.WARN] = { text = icons.WARN, texthl = "DiagnosticSignWarn" },
			[severities.INFO] = { text = icons.INFO, texthl = "DiagnosticSignInfo" },
			[severities.HINT] = { text = icons.HINT, texthl = "DiagnosticSignHint" },
		},
	},

	-- Show diagnostics as virtual text at the end of the line.
	virtual_text = {
		-- This function determines the prefix based on the diagnostic's severity.
		-- When severity_sort is true, the first diagnostic passed to this function
		-- will always be the highest-priority one on the line.
		prefix = function(diagnostic)
			if diagnostic.severity == severities.ERROR then
				return icons.ERROR
			elseif diagnostic.severity == severities.WARN then
				return icons.WARN
			elseif diagnostic.severity == severities.INFO then
				return icons.INFO
			elseif diagnostic.severity == severities.HINT then
				return icons.HINT
			end
		end,
	},

	-- Other settings
	underline = true,
	update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		header = "",
		prefix = "",
	},
})
