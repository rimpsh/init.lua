local neogit = require('neogit')

neogit.setup {
    disable_commit_confirmation = true,
    disable_context_highlighting = true,
    console_timeout = 2000,
    integrations = {
        diffview = true
    },
}
