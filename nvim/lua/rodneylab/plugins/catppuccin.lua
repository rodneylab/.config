require("catppuccin").setup({
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	color_overrides = {
		mocha = {
			base = "#1b1b29",
		},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
	},
	lualine = {
		all = function(colors)
			---@type CtpIntegrationLualineOverride
			return {
				command = {
					a = { bg = colors.text },
					b = { fg = colors.text },
				},
			}
		end,
	},
})
