local lsp = require("lsp-zero")

lsp.preset("recommended")

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { 
		'lua_ls',
		'rust_analyzer',
		'clangd',
		'pylsp',
	},
	handlers = {
	lsp.default_setup
	},
})



local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select } 
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), 
	['<C-y>'] = cmp.mapping.confirm({ select = false}),
	['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mappings = cmp.mapping.preset.insert(cmp_mappings),
})

lsp.on_attach(function(client, bufnr) 

	local opts = { buffer = bufnr, remap = false }
	
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

end)

lsp.setup()
