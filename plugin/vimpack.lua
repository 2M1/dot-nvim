

local function github(slug) 
    return "https://www.github.com/".. slug
end

local function loadplugin(name)
    vim.cmd("packadd " .. name)
end

local function loadsetupplugin(name)
    loadplugin(name)
    local cleaned = name:gsub("%.nvim$", "")
    require(cleaned).setup({})
end



vim.pack.add({
    github("lewis6991/gitsigns.nvim"),
    github("L3MON4D3/LuaSnip"),
  	github("obsidian-nvim/obsidian.nvim"),
    github("olimorris/onedarkpro.nvim"),
    github("nvim-tree/nvim-web-devicons"),
    github("prichrd/netrw.nvim"),
})

loadplugin("onedarkpro.nvim")
loadplugin("gitsigns.nvim")
loadplugin("obsidian.nvim")
loadsetupplugin("nvim-web-devicons")
loadsetupplugin("netrw.nvim")


require("gitsigns").setup({
    numhl=true,
    signcolumn=true,
})

