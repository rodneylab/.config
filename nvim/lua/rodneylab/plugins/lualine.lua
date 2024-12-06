if vim.g.neovide then
	-- override built-in catpuccin theme
	local C = require("catppuccin.palettes").get_palette("mocha")
	local O = require("catppuccin").options
	local transparent_bg = O.transparent_background and "NONE" or C.mantle

	require("lualine").setup({
		options = {
			theme = {
				normal = {
					a = { bg = C.blue, fg = C.mantle, gui = "bold" },
					b = { bg = C.surface0, fg = C.blue },
					c = { bg = transparent_bg, fg = C.text },
				},
				insert = {
					a = { bg = C.green, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.green },
				},
				terminal = {
					a = { bg = C.green, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.green },
				},
				command = {
					-- a = { bg = C.peach, fg = C.base, gui = "bold" },
					a = { bg = C.text, fg = C.base, gui = "bold" }, -- override bg
					-- b = { bg = C.surface0, fg = C.peach },
					b = { bg = C.surface0, fg = C.text }, -- override fg
				},
				visual = {
					a = { bg = C.mauve, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.mauve },
				},
				replace = {
					a = { bg = C.red, fg = C.base, gui = "bold" },
					b = { bg = C.surface0, fg = C.red },
				},
				inactive = {
					a = { bg = transparent_bg, fg = C.blue },
					b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
					c = { bg = transparent_bg, fg = C.overlay0 },
				},
			},
		},
	})
else
	require("lualine").setup({
		options = {
			icons_enabled = false,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			theme = "onedark",
		},
	})
end
