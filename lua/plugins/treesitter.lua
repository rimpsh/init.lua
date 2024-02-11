return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        event = { "BufEnter" },
        dependencies = {
            -- Additional text objects for treesitter
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            ---@diagnostic disable: missing-fields
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "css",
                    "go",
                    "graphql",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "markdown",
                    "rust",
                    "tsx",
                    "typescript",
                    "vue",
                    "vim",
                    "yaml",
                    "yang",
                    "zig",
                },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    max_file_lines = 10000,
                },
                indent = {
                    enable = true,
                },
                autopairs = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
                --[[ context_commentstring = {
					enable = true,
					enable_autocmd = false,
				}, ]]
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "<c-s>",
                        node_decremental = "<c-backspace>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",

                            ["ac"] = "@conditional.outer",
                            ["ic"] = "@conditional.inner",

                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>f"] = "@function.outer",
                            ["<leader>a"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>F"] = "@function.outer",
                            ["<leader>A"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            })
        end,
    },
}
