return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- startup
    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    }
    -- indent
    use "lukas-reineke/indent-blankline.nvim"

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- speedup
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'

    -- telescope
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- theme
    use 'EdenEast/nightfox.nvim'

    -- buffer
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    } 
    use 'moll/vim-bbye' -- for more sensible delete buffer cmd

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
    -- visual cursor
    use {
        'mg979/vim-visual-multi',
        branch = 'master'
    }

    use 'simrat39/symbols-outline.nvim'

    -- Lspconfig
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
    use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
    use 'hrsh7th/cmp-path'     -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
    use 'hrsh7th/nvim-cmp'
    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'
    -- lspkind
    use 'onsails/lspkind.nvim'
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")

            saga.init_lsp_saga({
                -- your configuration
            })
        end,
    })
end)
