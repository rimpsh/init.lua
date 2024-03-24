local map = vim.keymap.set
local M = {}

-- navigation
map("n", "<leader>h", ":winc h<CR>", { noremap = true })
map("n", "<leader>j", ":winc j<CR>", { noremap = true })
map("n", "<leader>k", ":winc k<CR>", { noremap = true })
map("n", "<leader>l", ":winc l<CR>", { noremap = true })

-- structural replace
map({ "n", "x" }, "<leader>sr", ':lua require("ssr").open()<CR>')

-- neogit
map("n", "<leader>gs", ":Neogit<CR>", { noremap = true })

map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- neotree
map("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true })

-- neogen
map("n", "<leader>nf", function()
    require("neogen").generate({ type = "func" })
end)

map("n", "<leader>nt", function()
    require("neogen").generate({ type = "type" })
end)

-- undotree
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("n", "<leader>f", vim.lsp.buf.format)

-- telescope
map(
    "n",
    "<leader>ps",
    ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<CR>',
    { noremap = true }
)
map("n", "<C-p>", ':lua require("telescope.builtin").git_files()<CR>', { noremap = true })
map("n", "<leader>pf", ':lua require("telescope.builtin").find_files()<CR>', { noremap = true })
map(
    "n",
    "<leader>pw",
    ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
    { noremap = true }
)
map("n", "<leader>pb", ':lua require("telescope.builtin").buffers()<CR>', { noremap = true })
map("n", "<leader>vh", ':lua require("telescope.builtin").help_tags()<CR>', { noremap = true })
map("n", "<leader>gc", ':lua require("telescope.builtin").git_branches()<CR>', { noremap = true })

-- trouble
map("n", "<leader>tt", require("trouble").toggle)

map("n", "[t", function()
    require("trouble").next({ skip_groups = true, jump = true })
end)

map("n", "]t", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end)

-- harpoon
map("n", "<leader>ho", require("harpoon.ui").toggle_quick_menu)

-- add current file to harpoons marks
map("n", "<leader>ha", require("harpoon.mark").add_file)

-- clear current file from harpoons marks
map("n", "<leader>hr", require("harpoon.mark").rm_file)

-- clear marks
map("n", "<leader>hc", require("harpoon.mark").clear_all)

-- jump between harpoon marks
map("n", "<leader>1", function()
    require("harpoon.ui").nav_file(1)
end)

map("n", "<leader>2", function()
    require("harpoon.ui").nav_file(2)
end)

map("n", "<leader>3", function()
    require("harpoon.ui").nav_file(3)
end)

map("n", "<leader>4", function()
    require("harpoon.ui").nav_file(4)
end)

map("n", "<leader>5", function()
    require("harpoon.ui").nav_file(5)
end)

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(bufnr)
    local opts = { buffer = bufnr, remap = false }

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>vd", vim.diagnostic.open_float, opts)
    map("n", "[d", vim.diagnostic.goto_next, opts)
    map("n", "]d", vim.diagnostic.goto_prev, opts)
    map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    map("n", "<leader>gd", vim.lsp.buf.definition, opts)

    -- Telescope LSP keybinds --
    map("n", "<leader>gr", require("telescope.builtin").lsp_references, opts)

    map("n", "<leader>gi", require("telescope.builtin").lsp_implementations, opts)

    map("n", "<leader>bs", require("telescope.builtin").lsp_document_symbols, opts)

    map("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, opts)
end

return M
