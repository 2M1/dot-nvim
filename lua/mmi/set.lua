vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "
vim.opt.termguicolors = true

vim.opt.incsearch = true
vim.opt.scrolloff = 8


-- latex
vim.g.vimtex_view_method = 'zathura'
-- vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
vim.g.tex_flavor = 'lualatex'
vim.g.vimtex_compiler_latexmk = { options = {
    "-shell-escape",
    "-synctex=1",
    '-interaction=nonstopmode',
    '-file-line-error',
    '-verbose',
}}

vim.opt.conceallevel=1
vim.g.tex_conceal='abdmg'
