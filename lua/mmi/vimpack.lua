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

local function run_build(build, ev)
  if type(build) == "string" then
    -- vim command, e.g. "TSUpdate"
    vim.notify(("Executing %s"):format(build))
    vim.cmd(build)

  elseif type(build) == "table" then
    -- shell command, e.g. { "make" }
    vim.notify(("Building %s"):format(ev.data.path))
    local result = vim.system(build, {
      cwd = ev.data.path,
      text = true,
    }):wait()

    if result.code ~= 0 then
      vim.notify(
        ("Build failed for %s:\n%s")
          :format(ev.data.spec.name or ev.data.spec.src, result.stderr),
        vim.log.levels.ERROR
      )
    end

  elseif type(build) == "function" then
    -- custom Lua hook
    build(ev)
  end

end


vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
      return
    end

    local spec = ev.data.spec
    local build = spec.data and spec.data.build
    if not build then
      return
    end

    -- support multiple build steps
    if vim.islist(build) and type(build[1]) ~= "string" then
      for _, step in ipairs(build) do
        run_build(step, ev)
      end
    else
      run_build(build, ev)
    end
  end,
})


vim.pack.add({
    github("nvim-lua/plenary.nvim"),
    github("lewis6991/gitsigns.nvim"),
    github("L3MON4D3/LuaSnip"),
    github("obsidian-nvim/obsidian.nvim"),
    github("olimorris/onedarkpro.nvim"),
    github("nvim-tree/nvim-web-devicons"),
    github("nvim-tree/nvim-tree.lua"),
    github("prichrd/netrw.nvim"),
    {
        src = github("nvim-treesitter/nvim-treesitter"),
        data = {
            build = "TSUpdate"
        },
    },
    {
        src = github("nvim-telescope/telescope-fzf-native.nvim"),
        data = {
            build = { "make" },
        }
    },
    github("nvim-telescope/telescope-project.nvim"),
    {
        src = github("nvim-telescope/telescope.nvim"),
        version = vim.version.range("*"),
    },

    -- lsps:

    github("williamboman/mason.nvim"),
    github("williamboman/mason-lspconfig.nvim"),
    github("neovim/nvim-lspconfig"),

    -- markdown:
    github("OXY2DEV/markview.nvim"),
    {
        src = github("toppair/peek.nvim"),
        build = {
            'deno task --quiet build:fast'
        }
    },

    -- latex:
    github("barreiroleo/ltex_extra.nvim"),
    github("lervag/vimtex"),
})

-- load always loaded plugins
loadplugin("onedarkpro.nvim")
loadplugin("gitsigns.nvim")
loadplugin("obsidian.nvim")
loadsetupplugin("nvim-web-devicons")
loadplugin("netrw.nvim")
loadplugin("nvim-tree.lua")

-- require("nvim-web-devicons").setup({})
-- require("netrw.nvim").setup({})
loadplugin("nvim-treesitter")
loadplugin("telescope-fzf-native.nvim")
loadplugin("telescope.nvim")
-- loadplugin("OXY2DEV/markview.nvim")
-- loadplugin("toppair/peek.nvim")
--
-- -- lsps:
loadplugin("mason.nvim")
loadplugin("nvim-lspconfig")
loadplugin("mason-lspconfig.nvim")
loadplugin("vimtex")
--
require("gitsigns").setup({
    numhl=true,
    signcolumn=true,
})

require("netrw").setup({
    use_devicons = true,
})
