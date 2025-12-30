local lint = require("lint")

lint.linters_by_ft = {
	astro = { "eslint_d" },
	cpp = { "clangtidy" },
	css = { "stylelint" },
	dockerfile = { "hadolint" },
	elixir = { "credo" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	prisma = { "prisma-lint" },
	python = { "ruff" },
	scss = { "stylelint" },
	sh = { "shellcheck" },
	sql = { "sqruff" },
	svelte = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
