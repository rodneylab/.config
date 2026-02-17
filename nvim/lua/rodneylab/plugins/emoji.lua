require("emoji").setup({ enable_cmp_integration = true, plugin_path = vim.fn.expand("$HOME/.config/nvim/plugged") })

local keymap = vim.keymap
local ts = require("telescope").load_extension("emoji")

keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji" })
