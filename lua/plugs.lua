vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- ai
    use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }

    -- themes
    use { "catppuccin/nvim", as = "catppuccin" }

    -- colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }

    -- web dev icons
    use ('nvim-tree/nvim-web-devicons')

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

    -- indent
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require("ibl").setup()
        end
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- ufo (for fold lines)
    use {
        "kevinhwang91/nvim-ufo",
        requires = {
            "kevinhwang91/promise-async",
            {
                "luukvbaal/statuscol.nvim",
                config = function()
                    local builtin = require("statuscol.builtin")
                    require("statuscol").setup(
                    {
                        relculright = true,
                        segments = {
                            {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
                            {text = {"%s"}, click = "v:lua.ScSa"},
                            {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
                        }
                    }
                    )
                end
            }
        }
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

    -- trouble
    use ('folke/trouble.nvim')

    -- fugitive
    use('tpope/vim-fugitive')

    -- lazygit
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        }
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
