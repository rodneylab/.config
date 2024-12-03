local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
		cmake = { "cmake_format" },
		css = { "prettierd", "prettier", stop_after_first = true },
		gdscript = { "gdformat" },
		just = { "just" },
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		sh = { "shfmt" },
		sql = { "sleek" },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		toml = { "dprint" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "yamlfmt" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})
conform.formatters.gdformat = {
	command = "uv",
	prepend_args = function(self, ctx)
		return { "run", "gdformat" }
	end,
}

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end, { desc = "Format file or range (in visual mode)" })
