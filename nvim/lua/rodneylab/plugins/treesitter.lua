local treesitter = require("nvim-treesitter.configs")

treesitter.wgsl = {
	install_info = {
		url = "https://github.com/szebniok/tree-sitter-wgsl",
		files = { "src/parser.c" },
	},
}

treesitter.setup({
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	-- requires nvim-ts-autotag
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	ensure_installed = {
		"astro",
		"bash",
		"cmake",
		"cpp",
		"css",
		"dart",
		"dockerfile",
		"elixir",
		"gdscript",
		"gitignore",
		"graphql",
		"html",
		"javascript",
		"json",
		"just",
		"lua",
		"markdown",
		"markdown_inline",
		"muttrc",
		"prisma",
		"proto",
		"rust",
		"sql",
		"svelte",
		"tmux",
		"toml",
		"tsx",
		"typescript",
		"vhs",
		"vim",
		"vimdoc",
		"wgsl",
		"yaml",
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})
