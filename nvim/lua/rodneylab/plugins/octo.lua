local octo = require("octo")

octo.setup({
	picker = "snacks",
})

local keymap = vim.keymap

keymap.set(
	"n",
	"<leader>op",
	"<cmd>Octo pr list<cr>",
	{ silent = true, noremap = true, desc = "List GitHub PullRequests" }
)
