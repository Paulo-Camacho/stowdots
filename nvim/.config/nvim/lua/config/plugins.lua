-- build hook must be registered BEFORE vim.pack.add(), or it misses the install
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "compile telescope-fzf-native",
	callback = function(ev)
		if
			ev.data.spec.name == "telescope-fzf-native.nvim"
			and (ev.data.kind == "install" or ev.data.kind == "update")
		then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-lua/plenary.nvim", -- required by telescope
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- optional, big speedup
})

-- icons : these icons are used inside of the oil view
require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons() -- telescope looks for nvim-web-devicons

-- oil
require("oil").setup({
	default_file_explorer = true, -- replaces netrw
	view_options = { show_hidden = true },

	float = {
		preview_split = "right", -- list on the left, preview on the right
		padding = 1,             -- was 2; less of the buffer underneath shows through
		max_width = 0.96,
		max_height = 0.92,
		win_options = { winblend = 0 }, -- fully opaque
	},

	preview_win = {
		update_on_cursor_moved = true, -- preview follows the cursor
		preview_method = "scratch",    -- syntax highlight, but no LSP attach
		disable_preview = function(filename)
			if vim.fn.getfsize(filename) > 1024 * 1024 then
				return true
			end
			return filename:match("%.pdf$")
				or filename:match("%.png$")
				or filename:match("%.jpe?g$")
				or filename:match("%.gif$")
				or filename:match("%.mp4$")
		end,
		win_options = {
			number = false,
			relativenumber = false,
			signcolumn = "no",
			cursorline = false,
			wrap = false,
		},
	},

	keymaps = {
		["<CR>"] = "actions.select",
		["-"] = { "actions.parent", mode = "n" },
		["q"] = { "actions.close", mode = "n" },
		["<Esc>"] = { "actions.close", mode = "n" },
		["<leader>."] = { "actions.close", mode = "n" }, -- same key toggles it shut
		["<C-p>"] = "actions.preview",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["<C-d>"] = "actions.preview_scroll_down",
		["<C-u>"] = "actions.preview_scroll_up",
	},
})

-- oil only opens a preview when asked. re-open it on every oil buffer so the
-- split survives navigating into a subdirectory.
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	desc = "always show the oil preview split",
	callback = vim.schedule_wrap(function(args)
		local oil = require("oil")
		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
			oil.open_preview()
		end
	end),
})

-- telescope
local telescope = require("telescope")
telescope.setup({
	defaults = {
		path_display = { "truncate" },
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			prompt_position = "top",
			horizontal = {
				preview_width = 0.55, -- preview takes the right 55%
				mirror = false,       -- prompt + results left, preview right
				preview_cutoff = 100, -- drop the preview under 100 columns
			},
		},
		vimgrep_arguments = {
			"rg", "--color=never", "--no-heading", "--with-filename",
			"--line-number", "--column", "--smart-case", "--hidden",
			"--glob", "!**/.git/*",
		},
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-u>"] = false, -- free it up to clear the prompt line
				["<Esc>"] = "close", -- one Esc closes instead of going to normal mode
			},
		},
	},
	pickers = {
		find_files = { hidden = true },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

pcall(telescope.load_extension, "fzf") -- no-op if make hasn't run yet
