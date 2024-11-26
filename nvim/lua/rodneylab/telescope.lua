local telescope = require("telescope")
local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = { "node_modules", "target" },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
		vimgrep_arguments = {
			-- used by grep_string and live_grep
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"-uu", -- => --no-ignore (.gitignore and .ignore files not ignored) and also --hidden (hidden files and directories will be included)
		},
	},
	extensions = {
		live_grep_args = {
			mappings = {
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob" }),
					["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
					["<C-space>"] = lga_actions.to_fuzzy_refine,
				},
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true, noremap = true })

keymap.set(
	"n",
	"<leader>fg",
	":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
	{ silent = true, noremap = true }
)

keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true, noremap = true })
keymap.set(
	"n",
	"<leader>fc",
	"<cmd>Telescope grep_string<cr>",
	{ silent = true, noremap = true, desc = "Find string under cursor" }
)
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true, desc = "Find todos" })

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true, noremap = true })
keymap.set(
	"n",
	"<leader>fr",
	"<cmd>Telescope oldfiles<cr>",
	{ silent = true, noremap = true, desc = "Find recently opened files" }
)

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
