--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
        root_folder_label = false,
	},
	filters = {
		dotfiles = true,
	},
    disable_netrw = true,
    hijack_netrw = true,
    view = {
        adaptive_size = false,
        side = "left",
        --width = 30,
        width = 22,
    }
})

