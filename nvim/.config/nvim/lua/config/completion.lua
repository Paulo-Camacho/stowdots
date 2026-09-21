-- blink.cmp: completion, snippets and signature help.
-- the fuzzy matcher is a rust binary; pinning the plugin to the v1 tag range
-- (see config.plugins) makes blink fetch a prebuilt one on first start instead
-- of shelling out to cargo.
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

	appearance = {
		nerd_font_variant = "mono",
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
			},
		},
		-- inline preview of the selected item, but not while a snippet is
		-- being filled in -- the two overlap badly
		ghost_text = { enabled = true },
		list = {
			selection = { preselect = true, auto_insert = false },
		},
	},

	signature = {
		enabled = true,
		window = { border = "rounded" },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	snippets = { preset = "default" },

	-- friendly-snippets is on the runtimepath; blink picks it up through the
	-- default snippet preset
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
