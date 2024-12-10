local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
		-- expand = function(args)
		-- 	vim.fn["vsnip#anonymous"](args.body)
		-- end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp", keyword_length = 3 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "buffer", keyword_length = 2 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "vsnip", keyword_length = 2 },
		{ name = "path" },
		{ name = "calc" },
		{ name = "crates" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
		-- format = function(entry, item)
		-- 	local menu_icon = {
		-- 		nvim_lsp = "λ",
		-- 		vsnip = "⋗",
		-- 		buffer = "Ω",
		-- 		path = "💾",
		-- 	}
		-- 	item.menu = menu_icon[entry.source.name]
		-- 	return item
		-- end,
	},
})
