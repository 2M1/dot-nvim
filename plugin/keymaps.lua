vim.g.mapleader = " "
vim.g.localleader = "\\"

-- filetree navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better movements in wrapped lines:
vim.keymap.set("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

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
vim.keymap.set("n", "n", "nzzzv") -- while search
vim.keymap.set("n", "N", "Nzzzv")

-- keep selection when indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- unhighlight search:
vim.keymap.set("n", "<leader>c", ":nohls<CR>")

-- spelling
vim.keymap.set("n", "<leader>l", function()
    local languages = { "en_gb", "de" }
    local current_lang = vim.opt.spelllang:get()[1]

    local current_idx = 1

    for i, lang in ipairs(languages) do
        if lang == current_lang then
            current_idx = i
            break
        end
    end

    local next_idx = (current_idx % #languages) + 1

    vim.opt.spelllang = { languages[next_idx] }
end)

-- keep highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "move to next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "move to previous buffer" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "split windows vertically" })
vim.keymap.set("n", "<leader>sh", ":hsplit<CR>", { desc = "split window horizontally" })
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-Right>", ":vertical resize 2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-Down>", ":resize 2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- terminal:
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")


vim.keymap.set("n", "<leader>po", function() vim.cmd('Telescope projects') end, opts)
