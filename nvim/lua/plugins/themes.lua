return {
	--[[ {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("darkrose").setup({
        -- Override colors
        colors = {
          orange = "#F87757",
        },
        -- Override existing or add new highlight groups
        overrides = function(c)
          return {
            Class = { fg = c.magenta },
            ["@variable"] = { fg = c.fg_dark },
          }
        end,
        -- Styles to enable or disable
        styles = {
          bold = true,      -- Enable bold highlights for some highlight groups
          italic = true,    -- Enable italic highlights for some highlight groups
          underline = true, -- Enable underline highlights for some highlight groups
        }
      })
    end
  },
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    lazy = false,
    priority = 1000,
  }, ]]
	--[[ {
    "rijulpaul/nightblossom.nvim",
    name = "nightblossom",
    lazy = false,
    priority = 1000,
    config = function()
      require('nightblossom').setup({
        variant = 'sakura',
        transparent = true,
        Comment = {
          italic = true,
          bold = true,
        },
        Function = {
          italic = true,
        }
      })
    end,
  }, ]]
	--[[ {
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
			})
		end,
	}, ]]
	--[[ {
		"kepano/flexoki-neovim",
		name = "flexoki",
		priority = 1000,
		config = function()
			require("flexoki").setup({})
		end,
	}, ]]
	-- {
	-- 	"tiagovla/tokyodark.nvim",
	-- 	name = "tokyodark",
	-- 	priority = 1000,
	-- 	opts = {
	-- 		-- custom options here
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("tokyodark").setup(opts) -- calling setup is optional
	-- 	end,
	-- },
	--[[ {
		"barrientosvctor/abyss.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("abyss").setup({
				italic_comment = true,
				italic = true,
				bold = true,
				transparent_background = true,
				treesitter = true,
				palette = "abyss",
				overrides = {},
			})
		end,
	},
	{
		"Biscuit-Theme/nvim",
		name = "biscuit",
		config = function()
			require("biscuit").setup({})
		end,
	}, ]]
	--	{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				theme = "emperor",
				variant = "dark",
				code_style = {
					comments = "none",
					conditionals = "italic",
					functinons = "italic",
					keywords = "none",
					headings = "bold",
					operators = "none",
					keyword_return = "italic",
					strings = "none",
					variables = "none",
				},
			})
			require("black-metal").load()
		end,
	},
}
