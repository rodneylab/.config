local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
		cmake = { "gersemi" },
		css = { "prettierd", "prettier", stop_after_first = true },
		dart = { "dart_format", "dcm_fix", stop_after_first = false },
		dockerfile = { "dockerfmt" },
		elixir = { "mix" },
		gdscript = { "gdformat" },
		graphql = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		htmldjango = { "djlint", "prettierd", "prettier", stop_after_first = true },
		just = { "just" },
		lua = { "stylua" },
		javascript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
		json = { "oxfmt", "prettierd", "prettier", "dprint", stop_after_first = true },
		markdown = { "prettierd", "prettier", "dprint", "markdownlint-cli2", "markdown-toc", stop_after_first = true },
		python = { "ruff" },
		sh = { "shfmt" },
		sql = { "sleek", "sqruff", stop_after_first = false },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		toml = { "dprint" },
		typescript = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
		typst = { "typstyle" },
		vue = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
		yaml = { "yamlfmt" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})
conform.formatters.gdformat = {
	command = "uv",
	prepend_args = function(_, _)
		return { "run", "gdformat" }
	end,
}

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end, { desc = "Format file or range (in visual mode)" })
