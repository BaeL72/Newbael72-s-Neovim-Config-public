vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	pattern = { "*.c", "*.cpp", "*.h" },
	callback = function()
		vim.lsp.enable("clangd")
	end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	pattern = { "*.lua" },
	callback = function()
		vim.lsp.config["luals"] = {
			cmd = { "lua-language-server" },
		}
		vim.lsp.enable("luals")
		vim.lsp.enable("stylua")
	end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	pattern = { "*.py" },
	callback = function()
		vim.lsp.enable("pyright")
	end,
})
