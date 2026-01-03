require("themery").setup({
	themes = {
		{
			name = "C",
			colorscheme = "kanagawa",
			before = [[
if vim.g.neovide then
    vim.g.lightline = { colorscheme = 'kanagawa' }
end
vim.opt.guifont = "JetBrains Mono,DM Mono,IosevkaTerm NFM:h13:#e-subpixelantialias"
vim.opt.linespace = 4
            ]],
		},
		{
			name = "Dart",
			colorscheme = "ayu",
			before = [[
if vim.g.neovide then
    vim.g.lightline = { colorscheme = 'ayu' }
end
vim.opt.guifont = "MesloLGM Nerd Font,Monoid Nerd Font,DM Mono,IosevkaTerm NFM:h13:#e-subpixelantialias"
vim.opt.linespace = 10
            ]],
		},
		{
			name = "Elixir",
			colorscheme = "flow",
			before = [[
if vim.g.neovide then
    require("flow").setup{}
    vim.cmd "colorscheme flow"
end
vim.opt.guifont = "IBM Plex Mono,Hack,IosevkaTerm NFM:h14:#e-subpixelantialias"
vim.opt.linespace = 3
            ]],
		},
		{
			name = "JavaScript",
			colorscheme = "sonokai",
			before = [[
if vim.g.neovide then
    vim.g.sonokai_style = 'andromeda'
    vim.g.sonokai_better_performance = 1
    vim.cmd.colorscheme('sonokai')
    require("lualine").setup()
end

vim.opt.guifont = "Hasklig,IosevkaTerm NFM:h13.5:#e-subpixelantialias"
vim.opt.linespace = 4
]],
		},
		{
			name = "Python",
			colorscheme = "github_dark_dimmed",
			before = [[
vim.cmd("colorscheme github_dark_dimmed")
vim.opt.guifont = "Fira Code,JetBrains Mono,IosevkaTerm NFM:h13.5:#e-subpixelantialias"
vim.opt.linespace = 5
            ]],
		},
		{
			name = "Rust",
			colorscheme = "catppuccin",
			before = [[
vim.opt.guifont = "Iosevka Custom,JetBrains Mono,IosevkaTerm NFM:h13.5:#e-subpixelantialias"
vim.opt.linespace = 5
            ]],
		},
		{
			name = "Terminal",
			colorscheme = "onedark",
			before = [[
vim.opt.background = "dark"
            ]],
		},
	},
})
