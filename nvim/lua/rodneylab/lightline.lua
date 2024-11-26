local colorscheme = "onedark"

if vim.g.neovide then
	colorscheme = "catppuccin"
end
vim.g.lightline = {
	active = {
		left = {
			{ "mode", "past" },
			{ "gitbranch", "filename", "modified" },
		},
	},
	colorscheme = colorscheme,
	component_function = {
		gitbranch = "fugitive#head",
	},
}
