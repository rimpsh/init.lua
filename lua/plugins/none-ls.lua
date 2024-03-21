return {
    -- Install none-ls for diagnostics, code actions, and formatting
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost" },
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        -- Congifure LSP linting, formatting, diagnostics, and code actions
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            border = "rounded",
            sources = {
                -- formatting
                formatting.prettierd,
                formatting.buf,

                -- diagnostics
                require("none-ls.diagnostics.eslint_d").with({
                    condition = function(utils)
                        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
                    end,
                }),
                diagnostics.buf,
                diagnostics.yamllint,

                -- code actions
                require("none-ls.code_actions.eslint_d").with({
                    condition = function(utils)
                        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
                    end,
                }),
            },
        })
    end,
}
