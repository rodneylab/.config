local treesitter = require("nvim-treesitter")
local function treelocation()
	return treesitter.statusline({
		indicator_size = 70,
		type_paterns = { "class", "function", "method" },
		separator = " ->",
	})
end

if vim.g.neovide then
	-- override built-in catpuccin theme
	local C = require("catppuccin.palettes").get_palette("mocha")
	local custom_catppucin = require("lualine.themes.catppuccin")
	custom_catppucin.command.a.bg = C.text
	custom_catppucin.command.b.fg = C.text

	require("lualine").setup({
		options = {
			theme = custom_catppucin,
		},
		sections = {
			lualine_c = { "filename", { treelocation } },
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
