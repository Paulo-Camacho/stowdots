-- telescope: fuzzy finding. keymaps live in config.keymaps.
local telescope = require("telescope")

telescope.setup({
	defaults = {
		path_display = { "truncate" },
		disable_devicons = true,
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			horizontal = {
				preview_width = 0.55, -- preview takes the right 55%
				preview_cutoff = 100, -- drop the preview under 100 columns
			},
		},
		-- stylua: ignore
		vimgrep_arguments = {
			"rg", "--color=never", "--no-heading", "--with-filename",
			"--line-number", "--column", "--smart-case", "--hidden",
			"--glob", "!**/.git/*",
		},
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-u>"] = false, -- back to vim's own: clear the prompt line
				["<Esc>"] = "close", -- one Esc closes instead of going to normal mode
			},
		},
	},
	pickers = {
		find_files = { hidden = true },
	},
})

pcall(telescope.load_extension, "fzf") -- no-op if `make` has not run yet
