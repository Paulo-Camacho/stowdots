-- blink.cmp: completion, snippets (friendly-snippets, picked up from the
-- runtimepath) and signature help. the bracket-on-accept rule is in
-- config.pairs.
require("blink.cmp").setup({
	-- <CR> accepts, <C-j>/<C-k> walk the menu to match the telescope bindings,
	-- <Tab>/<S-Tab> hop between snippet placeholders.
	keymap = {
		preset = "enter",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
	},

	completion = {
		-- documentation window opens on its own after a short pause
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = { border = "rounded" },
		},
		menu = {
			border = "rounded",
			draw = {
				treesitter = { "lsp" }, -- highlight the labels like real code
				-- kind as text instead of a nerd-font kind icon
				columns = { { "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
		ghost_text = { enabled = true }, -- inline preview of the selected item
		-- first item is preselected, but nothing is inserted until <CR>
		list = { selection = { preselect = true, auto_insert = false } },
	},

	signature = {
		enabled = true,
		window = { border = "rounded" },
	},
})
