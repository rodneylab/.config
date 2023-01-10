if vim.g.neovide then
    local keymapOpts = {
        silent = true,
        noremap = true
    }
    vim.keymap.set({"n","v"}, "<D-v>", "\"*p", keymapOpts)
    vim.keymap.set({"n","v"}, "<D-c>", "\"*y", keymapOpts)
    vim.keymap.set({"n","v"}, "<D-x>", "\"*x", keymapOpts)
end
