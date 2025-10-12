return {
	"CRAG666/code_runner.nvim",
	config = function()
		require("code_runner").setup({
			filetype = {
				c = {
					"cd $dir &&",
					"gcc -Wall -Wextra -Wpedantic -O2 -g $fileName -o $fileNameWithoutExt -lm -lpthread &&",
					"$dir/$fileNameWithoutExt",
					"&& rm $fileNameWithoutExt", -- cleanup binary after run
				},
				cpp = {
					"cd $dir &&",
					"g++ -Wall -Wextra -Wpedantic -std=c++20 -O2 -g $fileName -o $fileNameWithoutExt -lm -lpthread &&",
					"$dir/$fileNameWithoutExt",
					"&& rm $fileNameWithoutExt", -- cleanup binary after run
				},
				python = {
					"python3 -u",
				},
			},
		})
	end,
}
