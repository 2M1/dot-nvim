

if jit.os == "OSX" then
    vim.g.vimtex_view_method = "skim"
else
    vim.g.vimtex_view_method = 'zathura'
end


vim.g.tex_flavor = 'lualatex'
vim.g.vimtex_compiler_latexmk = { options = {
    "-lualatex",
    "-shell-escape",
    "-synctex=1",
    '-interaction=nonstopmode',
    '-file-line-error',
    '-verbose',
}}
vim.g.vimtex_compiler_latexmk_engine = {
        _ = '-lualatex',
}

vim.opt.conceallevel=1
vim.g.tex_conceal='abdmg'

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true
