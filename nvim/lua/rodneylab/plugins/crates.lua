local crates = require("crates")
crates.setup({
	completion = {
		cmp = { enabled = true },
	},
})

local keymap = vim.keymap

keymap.set("n", "<leader>ct", crates.toggle, { desc = "Toggle crates" })
keymap.set("n", "<leader>cr", crates.reload, { desc = "Reload crates" })

keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "Show crate versions" })
keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show crate features" })
keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "Show crate dependencies" })

keymap.set("n", "<leader>cu", crates.update_crate, { desc = "Update crate" })
