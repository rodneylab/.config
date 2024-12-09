if vim.g.neovide then
	vim.g.neovide_input_macos_option_key_is_meta = true
	vim.opt.termguicolors = true
	local keymapOpts = {
		silent = true,
		noremap = true,
	}
	vim.keymap.set({ "n", "v" }, "<D-v>", '"*p', keymapOpts)
	vim.keymap.set({ "n", "v" }, "<D-c>", '"*y', keymapOpts)
	vim.keymap.set({ "n", "v" }, "<D-x>", '"*x', keymapOpts)
	-- map '.' key on the number keypad to expected input
	vim.keymap.set({ "i" }, "<kDel>", ".", keymapOpts)
end
