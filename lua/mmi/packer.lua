-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'prichrd/netrw.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',

        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })
    use "olimorris/onedarkpro.nvim"
    use 'nvim-tree/nvim-web-devicons'
    use {
        "ahmedkhalf/project.nvim",
        config = function() 
            require("project_nvim").setup {
                show_hidden = true,
            }
        end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })

    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use { 'mhartington/formatter.nvim' }
    use('mfussenegger/nvim-lint')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- markdown preview:
    use(
        "toppair/peek.nvim",
        {
            run = 'deno task --quiet build:fast'
        })

    -- LaTeX
    use('lervag/vimtex')

    -- HTML/Browserpreviehtml
    use('tyru/open-browser.vim')
    use('tamago324/vim-browsersync')
    use(
        'windwp/nvim-ts-autotag'
    )
    use('Jezda1337/nvim-html-css')
end)
