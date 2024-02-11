return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
    },
    event = "VeryLazy",
    config = function()
        require("neogit").setup({
            disable_commit_confirmation = true,
            disable_context_highlighting = true,
            console_timeout = 2000,
            integrations = {
                diffview = true,
            },
        })
    end,
}
