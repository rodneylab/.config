local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "<space>ca", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr })
local opts = { noremap = true, silent = true }
opts.desc = "Show LSP definitions"
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
