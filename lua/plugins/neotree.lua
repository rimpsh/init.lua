return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = false,
                window = {
                    width = 30,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    },
                    mappings = {
                        ["<space>"] = {
                            "toggle_node",
                            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                        },
                        ["<2-LeftMouse>"] = "open",
                        ["<cr>"] = "open",
                        ["S"] = "open_split",
                        ["<C-v>"] = "open_vsplit",
                        -- ["S"] = "split_with_window_picker",
                        -- ["s"] = "vsplit_with_window_picker",
                        ["t"] = "open_tabnew",
                        ["w"] = "open_with_window_picker",
                        ["C"] = "close_node",
                        ["z"] = "close_all_nodes",
                        --["Z"] = "expand_all_nodes",
                        ["a"] = {
                            "add",
                            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                            config = {
                                show_path = "none", -- "none", "relative", "absolute"
                            },
                        },
                        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
                        ["d"] = "delete",
                        ["r"] = "rename",
                        ["y"] = "copy_to_clipboard",
                        ["x"] = "cut_to_clipboard",
                        ["p"] = "paste_from_clipboard",
                        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                        -- ["c"] = {
                        --  "copy",
                        --  config = {
                        --    show_path = "none" -- "none", "relative", "absolute"
                        --  }
                        --}
                        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                        ["q"] = "close_window",
                        ["R"] = "refresh",
                        ["?"] = "show_help",
                    },
                },
                buffers = {
                    follow_current_file = {
                        enabled = true,
                    },
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                            "node_modules",
                        },
                        never_show = {
                            ".DS_Store",
                        },
                    },
                },
            })
        end,
    },
}
