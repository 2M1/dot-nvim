require("mmi")

vim.opt.termguicolors = true
vim.cmd.colorscheme("onedark")


-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- undo history
local undodir = vim.fn.expand(os.getenv("HOME") .. "/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0
then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- completion
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0

-- auto reload on file changes
vim.opt.autoread = true
vim.opt.autowrite = false

--
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.hidden = true
vim.opt.encoding = "utf-8"
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
vim.opt.showmode = false
vim.opt.spell = true
vim.opt.spelllang = { "en_gb", } -- start-up spellcheck language

-- select, paste
vim.opt.selection = "inclusive"
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")

-- popup menu
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true

-- left side column
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"

