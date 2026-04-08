local treesitter = require("nvim-treesitter")
local function treelocation()
	return treesitter.statusline({
		indicator_size = 70,
		type_paterns = { "class", "function", "method" },
		separator = " ->",
	})
end

if vim.g.neovide then
	require("lualine").setup({
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
