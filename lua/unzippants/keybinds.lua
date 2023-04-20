local map = vim.keymap.set

map('n', '<space>', '<nop>', { noremap = true })
map('n', 'Q', '<nop>', { noremap = true })
vim.g.loaded_matchparen = 1
vim.g.mapleader = " "

-- navigation
map('n', '<leader>h', ':winc h<CR>', { noremap = true })
map('n', '<leader>j', ':winc j<CR>', { noremap = true })
map('n', '<leader>k', ':winc k<CR>', { noremap = true })
map('n', '<leader>l', ':winc l<CR>', { noremap = true })

-- git
map('n', '<leader>ga', ':Git fetch --all<CR>', { noremap = true })
map('n', '<leader>grum', ':Git rebase upstream/master<CR>', { noremap = true })
map('n', '<leader>grom', ':Git rebase origin/master<CR>', { noremap = true })
map('n', '<leader>gj', ':diffget //3<CR>', { noremap = true })
map('n', '<leader>gf', ':diffget //2<CR>', { noremap = true })
map('n', '<leader>gs', ':Neogit<CR>', { noremap = true })

-- resize
map('n', '<leader>+', ':vertical resize +5<CR>', { noremap = true })
map('n', '<leader>-', ':vertical resize -5<CR>', { noremap = true })
map('n', '<leader>rp', ':resize 100<CR>', { noremap = true })

-- hot stuff from theprimeagen
map('v', '<leader>p', '"_dp', { noremap = true })
map('v', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>Y', 'gg"+yG', { noremap = true })

-- others
map('n', '<leader>ghw', ':h <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
map('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true })
map('n', '<leader>u', ':UndotreeShow<CR>', { noremap = true })

-- telescope
map('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>',
    { noremap = true })
map('n', '<C-p>', ':lua require("telescope.builtin").git_files()<CR>', { noremap = true })
map('n', '<leader>pf', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true })
map('n', '<leader>pw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
    { noremap = true })
map('n', '<leader>pb', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true })
map('n', '<leader>vh', ':lua require("telescope.builtin").help_tags()<CR>', { noremap = true })
map('n', '<leader>gc', ':lua require("unzippants.telescope").git_branches()<CR>', { noremap = true })
map('n', '<leader>vi', ':lua vim.lsp.buf.implementation()<CR>', { noremap = true })
map('n', '<leader>vll', ':lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true })
map('n', '<leader>vrc', ':lua require("unzippants.telescope").dotfiles()<CR>', { noremap = true })

-- trouble
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })

-- refactor
map("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false })
map("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false })
map("v", "<Leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false })
map("v", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false })
map("n", "<Leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false })
map("n", "<leader>rp", ":lua require('refactoring').debug.printf({below = false})<CR>", { noremap = true })
map("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })
map("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })

-- quickfix
map('n', '<C-k>', ':cnext<CR>zz', { noremap = true });
map('n', '<C-j>', ':cprev<CR>zz', { noremap = true });
map('n', '<A-k>', ':lnext<CR>zz', { noremap = true });
map('n', '<A-j>', ':lprev<CR>zz', { noremap = true });
map('n', '<C-q>', "<cmd>lua require('unzippants.quickfix').toggle(1)<CR>", { noremap = true, silent = true });
map('n', '<Leader>q', "<cmd>lua require('unzippants.quickfix').toggle(0)<CR>", { noremap = true, silent = true });

-- worktree
map('n', '<leader>gws', ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true });
map('n', '<leader>gwc', ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", { noremap = true });

-- copilot
map('i', "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
