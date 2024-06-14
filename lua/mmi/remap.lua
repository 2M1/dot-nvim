vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better delete functions:
vim.keymap.set("n", "d", "\"_d", {noremap=true})
vim.keymap.set("v", "d", "\"_d", {noremap=true})
vim.keymap.set("n", "<leader>d", "d", {noremap=true})
vim.keymap.set("v", "<leader>d", "d", {noremap=true})

vim.keymap.set("n", "D", "\"_D", {noremap=true})
vim.keymap.set("v", "D", "\"_D", {noremap=true})

vim.keymap.set("n", "<leader>D", "D", {noremap=true})
vim.keymap.set("v", "<leader>D", "D", {noremap=true})

--- keep cursor in the middle when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- unhighlight search:
vim.keymap.set("n", "<leader>s", ":nohls")

-- terminal:
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")


vim.keymap.set("n", "<leader>po", function() vim.cmd('Telescope projects') end, opts)
