local map = vim.keymap.set
local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "white" } },            },
        }
    },
}

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.local/share/nvim/site/pack/packer/start/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
        print(path)
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})

map({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

map({ 'i', 's' }, '<C-j>', function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

map('i', '<C-l>', function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
