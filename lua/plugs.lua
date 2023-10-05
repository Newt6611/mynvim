vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- themes
    use { "catppuccin/nvim", as = "catppuccin" }

    -- treesitter
    use({'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'}})

    -- todo highlight
    use {
        'folke/todo-comments.nvim',
        config = function() require("todo-comments").setup {} end
    }

    -- hightlight cursor word
    use {
        'tzachar/local-highlight.nvim',
        config = function()
            require('local-highlight').setup()
        end
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- telescope fzf
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- harpoon
    use('theprimeagen/harpoon')

    -- undotree
    use('mbbill/undotree')

    -- gitsigns
    use('lewis6991/gitsigns.nvim')

    -- 
    use('tpope/vim-fugitive')
    
    -- lazygit
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    })

    -- neotree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- c# lsp extension
    use({ 'Hoffs/omnisharp-extended-lsp.nvim' })

    -- auto pair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- comment
    use {
        'numToStr/Comment.nvim',
    }
end)
