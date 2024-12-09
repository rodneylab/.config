local mason_tool_installer = require("mason-tool-installer")
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup()

mason_tool_installer.setup({
	ensure_installed = {
		"eslint_d",
	},
})
