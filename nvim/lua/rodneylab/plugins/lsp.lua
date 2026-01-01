vim.lsp.enable("ansiblels")
vim.lsp.enable("astro")
vim.lsp.enable("clangd")
vim.lsp.enable("cmake")
vim.lsp.enable("cssls")
vim.lsp.enable("dartls")
vim.lsp.enable("dprint")
vim.lsp.enable("elixirls")
vim.lsp.enable("gdscript")
vim.lsp.enable("graphql")
vim.lsp.enable("harper_ls")
vim.lsp.enable("html")
vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("prismals")
vim.lsp.enable("protols")
vim.lsp.enable("ruff")
vim.lsp.enable("svelte")
vim.lsp.enable("ts_ls")
vim.lsp.enable("wgsl_analyzer")

vim.lsp.config("harper_ls", {
	settings = {
		["harper-ls"] = {
			userDistPath = "~/dict.txt",
			linters = {
				OxfordComma = false,
				SentenceCapitalization = false,
				SpellCheck = false,
				ToDoHyphen = false,
			},
			dialect = "British",
		},
	},
})
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(args)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			desc = "Format current buffer",
			callback = function()
				-- vim.lsp.buf.format({ async = false, id = args.data.client_id, timeout_ms = 10000 })
				require("conform").format({ bufnr = buffer })
			end,
		})
		local bufmap = function(mode, rhs, lhs)
			vim.keymap.set(mode, rhs, lhs, { buffer = args.buf })
		end
		local opts = { noremap = true, silent = true }
		opts.desc = "Show LSP definitions"
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

		opts.desc = "Show LSP type definitions"
		bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

		opts.desc = "Show LSP declaration"
		bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

		opts.desc = "Format buffer"
		bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async=true})<cr>")
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘ ",
			[vim.diagnostic.severity.WARN] = "▲ ",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})

-- nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

-- better autocompletion experience
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

cmp.setup({
	preselect = cmp.PreselectMode.None,
	-- Format the autocomplete menu
	formatting = {
		format = lspkind.cmp_format(),
	},
	mapping = {
		-- Use Tab and shift-Tab to navigate autocomplete menu
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	source = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
})
