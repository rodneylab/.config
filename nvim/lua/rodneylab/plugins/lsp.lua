local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(_, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local opts = { noremap = true, silent = true }

	opts.desc = "Go to declaration"
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	opts.desc = ""
	buf_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

	opts.desc = "Show LSP definitions"
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	opts.desc = ""
	buf_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)

	opts.desc = "Show LSP type definitions"
	buf_set_keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	opts.desc = "Show documentation for what is under cursor"
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

	opts.desc = ""
	buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

	opts.desc = "Show implementations"
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	opts.desc = "Show LSP references"
	buf_set_keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

	opts.desc = ""
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)

	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)

	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

	opts.desc = "Show buffer diagnostics"
	buf_set_keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = "Show line diagnostics"
	buf_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float<CR>", opts)

	opts.desc = "Go to previous diagnostic"
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev", opts)

	opts.desc = "Go to next diagnostic"
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next", opts)

	opts.desc = ""
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition<CR>", opts)

	opts.desc = "Smart rename"
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	opts.desc = "See available code actions"
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	opts.desc = ""
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local servers = {
	"ansiblels",
	"astro",
	"clangd",
	"cmake",
	"csharp_ls",
	"cssls",
	"docker_compose_language_service",
	"dockerls",
	--   "dprint", -- initialised individually below
	"gdscript",
	"graphql",
	"html",
	-- "lua_ls", -- initialised individually below
	-- "marksman", -- initialised individually below
	"prismals",
	"protols",
	"ruff",
	"sqlls",
	"svelte",
	-- "ts_ls",  -- initialised individually below
	"wgsl_analyzer",
}

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

nvim_lsp.denols.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})

nvim_lsp.ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	single_file_support = false,
})

nvim_lsp.dprint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	fileypes = nvim_lsp.util.root_pattern("dockerfile", "json", "jsonc", "markdown", "toml"),
})

nvim_lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
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

nvim_lsp.marksman.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "markdown", "markdown.mdx" },
})

-- autoformat on save
vim.cmd("autocmd BufWritePre *.cc lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.cpp lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.h lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.lua lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.md* lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.py lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.toml lua vim.lsp.buf.format({async = false})")
vim.cmd("autocmd BufWritePre *.ts lua vim.lsp.buf.format({async = false})")

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
