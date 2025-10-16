return {
	"mfussenegger/nvim-dap",
	ft = { "c", "cpp", "rs" },
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
		},

		-- Virtual text during debugging
		"theHamsta/nvim-dap-virtual-text",

		-- Mason integration for easy installer
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({})

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					local cwd = vim.fn.getcwd()
					local target_dir = cwd .. "/target/debug/"
					local executables = {}

					-- Try to find executables in target/debug
					local handle = io.popen("find " .. target_dir .. " -maxdepth 1 -type f -executable 2>/dev/null")
					if handle then
						for file in handle:lines() do
							if not file:match("%.so$") and not file:match("%.d$") then
								table.insert(executables, file)
							end
						end
						handle:close()
					end

					if #executables == 1 then
						return executables[1]
					elseif #executables > 1 then
						return vim.fn.input("Select executable: ", target_dir, "file")
					else
						return vim.fn.input("Path to executable: ", target_dir, "file")
					end
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Replace your C/C++ configuration with this:
		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					local cwd = vim.fn.getcwd()
					local executables = {}

					-- Common executable names and locations
					local common_names = { "main", "a.out", "program", "app" }
					local common_dirs = { ".", "./build", "./bin", "./out", "./target/debug" }

					-- First, look for common executable names in common directories
					for _, dir in ipairs(common_dirs) do
						for _, name in ipairs(common_names) do
							local path = dir .. "/" .. name
							if vim.fn.executable(path) == 1 then
								table.insert(executables, path)
							end
						end
					end

					-- If no common names found, search for any executables
					if #executables == 0 then
						local handle = io.popen(
							"find " .. cwd .. " -maxdepth 2 -type f -executable 2>/dev/null | grep -v -E '\\.(so|a|d)$'"
						)
						if handle then
							for file in handle:lines() do
								-- Skip if it's in .git or other hidden directories
								if not file:match("/%.") then
									table.insert(executables, file)
								end
							end
							handle:close()
						end
					end

					-- Return based on what we found
					if #executables == 1 then
						print("Found executable: " .. executables[1])
						return executables[1]
					elseif #executables > 1 then
						-- Multiple executables found, let user choose
						print("Multiple executables found:")
						for i, exe in ipairs(executables) do
							print(i .. ": " .. exe)
						end
						local choice = vim.fn.input("Select executable (1-" .. #executables .. "): ")
						local index = tonumber(choice)
						if index and executables[index] then
							return executables[index]
						end
					end

					-- Fallback: ask user for path
					return vim.fn.input("Path to executable: ", cwd .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				environment = {},
			},
		}

		dap.configurations.cpp = dap.configurations.c
	end,
}
