require("catppuccin").setup({
	flavour = "default",
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
})
