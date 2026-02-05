-- Mason core
require("mason").setup()

-- LSP
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup({
	ensure_installed = {
		"ts_ls",  -- TypeScript / JavaScript (tên mới)
		"html",   -- HTML
		"cssls",  -- CSS
		"scssls", -- SCSS
		"intelephense", -- PHP
		"lua_ls", -- Lua
		"volar",  -- Vue 3 (thay vuels)
	},
})

-- Setup mặc định cho tất cả LSP
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
		})
	end,
})

-- ======================
-- nvim-cmp
-- ======================
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]",
			},
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
