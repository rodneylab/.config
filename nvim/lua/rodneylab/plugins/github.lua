local palettes = {
	github_dark_dimmed = {
		magenta = {
			-- base = "#b083f0",
			base = "#ffffff",
			-- bright = "#d2a8ff",
			bright = "#00ff00",
		},
	},
}
require("github-theme").setup({ palettes = palettes })
vim.cmd("colorscheme github_dark_dimmed")
