require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
		root_folder_label = false,
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_open = "",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = { ".DS_Store", "node_modules", "target" },
	},
	git = {
		ignore = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	view = {
		adaptive_size = false,
		float = {
			enable = true,
		},
		side = "right",
		width = 22,
	},
})

local keymap = vim.keymap

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle tree explorer" })
keymap.set(
	"n",
	"<leader>ef",
	"<cmd>NvimTreeFindFileToggle<CR>",
	{ desc = "Toggle tree explorer highlighting current file" }
)
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file tree explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file tree explorer" })
