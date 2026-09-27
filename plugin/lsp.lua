require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
		'lua_ls',
		'rust_analyzer',
		'clangd',
		'pylsp',
        'ltex_plus',
	},
})

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})

vim.lsp.config('ltex_plus', {
    use_spellfile = true,
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "markdown", },
            language = "auto"
        }
    }
})
vim.lsp.enable('ltex_plus')
