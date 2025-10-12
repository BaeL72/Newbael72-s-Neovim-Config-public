local map = vim.keymap.set
local optsmap = { noremap = true, silent = true, nowait = true }
local builtin = require("telescope.builtin")
local gitsigns = require("gitsigns")

--DEFAULT KEYMAPS REWORK

map({ "n", "v" }, ";", ":")
map({ "n", "v" }, "sl", "0", optsmap)
map({ "n", "v" }, "el", "$", optsmap)
map({ "n", "v" }, "w", "e", optsmap)

map("n", "<C-h>", "<C-w>h", optsmap)
map("n", "<C-l>", "<C-w>l", optsmap)
map("n", "<C-j>", "<C-w>j", optsmap)
map("n", "<C-k>", "<C-w>k", optsmap)

map("n", "<leader>sk", "<cmd>resize +2<cr>", optsmap, { desc = "Resize +2" })
map("n", "<leader>sj", "<cmd>resize -2<cr>", optsmap, { desc = "Resize -2" })
map("n", "<leader>sl", "<cmd>vertical resize -2<cr>", optsmap, { desc = "Vertical Resize -2" })
map("n", "<leader>sh", "<cmd>vertical resize +2<cr>", optsmap, { desc = "Vertical Resize +2" })

--TELESCOPE KEYMAPS

map("n", "<leader>lg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>bb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>ht", builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>fa", builtin.current_buffer_fuzzy_find, { desc = "Telescope fuzzy find in current buffer" })
map("n", "<leader>ac", builtin.commands, { desc = "Telescope Commands" })
map("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
map("n", "<leader>gB", builtin.git_bcommits, { desc = "Git Bcommits" })
map("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
map("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
map("n", "<leader>gh", builtin.git_stash, { desc = "Git Stash" })
map("n", "ts", builtin.treesitter, { desc = "Tree Sitter" })
map("n", "<leader>ak", builtin.keymaps, { desc = "Available Keymaps" })
map("n", "<leader>ld", "<cmd>w | Telescope diagnostics <cr>", { desc = "Diagnostics List" })

--FILE_BROWSER
map("n", "<leader>ff", ":Telescope file_browser<cr>", { silent = true }, { desc = "Telescope File Browser" })

--HOP NVIM

map({ "n", "v" }, "m", "<cmd>HopLine<cr>", { desc = "Hop Line" })
map({ "n", "v" }, "F", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
map({ "n", "v" }, "<leader><space>", "<cmd>HopWord<cr>", { desc = "Hop Word" })

-- RUST KEYMAPS

map("n", "<leader>rr", "<cmd>RustLsp run<cr>", optsmap, { desc = "Rust Run" }, { ft = "rs" })
map("n", "<leader>rR", "<cmd>RustLsp runnables<cr>", optsmap, { desc = "Rust Runnables" }, { ft = "rs" })
map("n", "<leader>rh", "<cmd>RustLsp hover actions<cr>", optsmap, { desc = "Rust Hover Actions" }, { ft = "rs" })
map("n", "<leader>rH", "<cmd>RustLsp hover range<cr>", optsmap, { desc = "Rust Hover Range" }, { ft = "rs" })
map("n", "<leader>ra", "<cmd>RustLsp codeAction<cr>", optsmap, { desc = "Rust Code Action" }, { ft = "rs" })

-- DAP KEYMAPS
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dB", "<cmd>DapSetLogLevel<cr>", { desc = "Set Log Level" })
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Run with Args" })
map("n", "<leader>dg", "<cmd>DapGoto<cr>", { desc = "Go to line (no execute)" })
map("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "Step Into" })
map("n", "<leader>dj", "<cmd>DapDown<cr>", { desc = "Down" })
map("n", "<leader>dk", "<cmd>DapUp<cr>", { desc = "Up" })
map("n", "<leader>dl", "<cmd>DapShowLog<cr>", { desc = "Show Log" })
map("n", "<leader>do", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
map("n", "<leader>dO", "<cmd>DapStepOut<cr>", { desc = "Step Out" })
map("n", "<leader>dp", "<cmd>DapPause<cr>", { desc = "Pause" })
map("n", "<leader>dr", "<cmd>DapRestart<cr>", { desc = "Restart" })
map("n", "<leader>ds", "<cmd>DapSessionSelect<cr>", { desc = "Session Select" })
map("n", "<leader>dt", "<cmd>DapTerminate<cr>", { desc = "Terminate" })

-- UI controls
map("n", "<leader>du", function()
	local ok, dapui = pcall(require, "dapui")
	if ok then
		dapui.toggle()
	else
		vim.notify("DAP UI not loaded", vim.log.levels.WARN)
	end
end, { desc = "Toggle Debug UI" })

-- C/C++ KEYMAPS

map("n", "<leader>mg", "<cmd>CMakeGenerate<cr>", { desc = "CMake Generate" }, { ft = { "c", "cpp", "h" } })
map("n", "<leader>mb", "<cmd>CMakeBuild<cr>", { desc = "CMake Build" }, { ft = { "c", "cpp", "h" } })
map("n", "<leader>mr", "<cmd>CMakeRun<cr>", { desc = "CMake Run" }, { ft = { "c", "cpp", "h" } })
map("n", "<leader>ml", "<cmd>CMakeClean<cr>", { desc = "CMake Clean" }, { ft = { "c", "cpp", "h" } })

-- CODE RUNNER
local ftforcr = { "c", "cpp", "py" }

map("n", "<leader>rc", "<cmd>w | RunCode<cr>", { desc = "Run Code" }, { ftforcr })

--LSP KEYMAPS
local lb = vim.lsp.buf

map({ "n", "v" }, "ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go To Definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go To Implementation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "gt", lb.type_definition, { desc = "Go To Type Definition" })
map("n", "gr", lb.references, { desc = "References" })
