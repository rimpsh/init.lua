require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'folke/tokyonight.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = false }
    }

    -- editorconfig
    use 'gpanders/editorconfig.nvim'

    -- undotree
    use 'mbbill/undotree'

    -- git plugins
    use 'tpope/vim-fugitive' -- this will be removed soon
    use 'junegunn/gv.vim'
    use {
        'TimUntersberger/neogit',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'sindrets/diffview.nvim' }
        }
    }

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' }
        }
    }

    -- diagnostic
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/playground' },
            { 'nvim-treesitter/nvim-treesitter-context' }
        },
    }

    -- refactoring
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }

    -- nvim tree file explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker",
        }
    }

    -- todo comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- git-worktree
    use {
        "ThePrimeagen/git-worktree.nvim",
        requires = {
            { "nvim-telescope/telescope.nvim" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzy-native.nvim" }
        }
    }

    -- copilot
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = false,
                    --auto_refresh = false,
                    --keymap = {
                    --    jump_prev = "[[",
                    --    jump_next = "]]",
                    --    accept = "<CR>",
                    --    refresh = "gr",
                    --    open = "<M-CR>"
                    --},
                    --layout = {
                    --    position = "bottom", -- | top | left | right
                    --    ratio = 0.4
                    --},
                },
                suggestion = {
                    enabled = false,
                    --auto_trigger = false,
                    --debounce = 75,
                    --keymap = {
                    --    accept = "<M-l>",
                    --    accept_word = false,
                    --    accept_line = false,
                    --    next = "<M-]>",
                    --    prev = "<M-[>",
                    --    dismiss = "<C-]>",
                    --},
                },
                filetypes = {
                    javascript = true,
                    typescript = true,
                    lua = true,
                    rust = true,
                    go = true,
                    zig = true,
                    ["*"] = false,             -- disable for all other filetypes and ignore default `filetypes`
                },
                copilot_node_command = 'node', -- Node.js version must be > 16.x
                server_opts_overrides = {},
            })
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    -- harpoon
    use("theprimeagen/harpoon")
end)
