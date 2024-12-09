require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		javascript = { "template_string" },
		lua = { "string" },
	},
	fast_wrap = {},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
