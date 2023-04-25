-- reference: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/options.lua
local prefix = vim.fn.expand("$HOME/.vim")
local options = {
    relativenumber = true,                           -- set relative numbered lines
    hlsearch = false,                                -- highlight all matches on previous search pattern
    hidden = true,                                   -- hide buffers instead of closing them; this ignores unwritten changes and allows to open new files nevertheless
    errorbells = false,                              -- disable the vims error sounds
    tabstop = 4,                                     -- insert 2 spaces for a tab
    softtabstop = 4,
    shiftwidth = 4,                                  -- the number of spaces inserted for each indentation
    expandtab = true,                                -- convert tabs to spaces
    smartindent = true,                              -- make indenting smarter again
    number = true,                                   -- set numbered lines
    wrap = false,                                    -- display lines as one long line
    swapfile = false,                                -- creates a swapfile
    backup = false,                                  -- creates a backup file
    undofile = true,                                 -- enable persistent undo
    undodir = { prefix .. "/undodir//" },            -- set undo directory for undotree
    incsearch = true,
    termguicolors = true,                            -- set term gui colors (most terminals support this)
    scrolloff = 8,                                   -- is one of my fav
    signcolumn = "yes",                              -- always show the sign column, otherwise it would shift the text each time
    cmdheight = 2,                                   -- more space in the neovim command line for displaying messages
    updatetime = 50,                                 -- faster completion (4000ms default)
    colorcolumn = "80",                              -- add a colored column
    completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
    clipboard = "unnamedplus",                       -- allows neovim to access the system clipboard
    conceallevel = 0,                                -- so that `` is visible in markdown files
    fileencoding = "utf-8",                          -- the encoding written to a file
    ignorecase = true,                               -- ignore case in search patterns
    mouse = "a",                                     -- allow the mouse to be used in neovim
    showmode = false,                                -- we don't need to see things like -- INSERT -- anymore
    splitbelow = true,                               -- force all horizontal splits to go below current window
    splitright = true,                               -- force all vertical splits to go to the right of current window
    cursorline = true,                               -- highlight the current line
    numberwidth = 2,                                 -- set number column width to 2
}

vim.opt.shortmess:append "c"
vim.opt.isfname:append "@-@"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
