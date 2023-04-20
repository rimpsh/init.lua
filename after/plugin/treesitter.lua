require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "phpdoc" },
    highlight = {
		enable = true,
        additional_vim_regex_highlighting = false,
        max_file_lines = 10000,
        disable = function(lang, bufnr)
            return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1048576
        end,
    },
    indent = { enable = false },
    incremental_selection = { enable = false },
    textobjects = {
        move = {
          enable = true,
          set_jumps = true,

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
    },
}
