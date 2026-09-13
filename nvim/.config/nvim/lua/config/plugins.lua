-- you want to lazy load to avoid neovim trying to run a program that still needs to be loaded
-- parsers treesitter should keep installed
local ts_langs = {
	"c", "python", "html", "css", "javascript", "typescript", "tsx",
	"json", "jsdoc", "lua", "vim", "vimdoc", "markdown", "markdown_inline",
}

-- build hooks must be registered BEFORE vim.pack.add(), or they miss the install
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "install treesitter parsers",
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind ~= "delete" then
			-- deferred: this fires from inside vim.pack.add(), before the plugin
			-- is on the runtimepath, so require() here would fail
			vim.schedule(function()
				require("nvim-treesitter").install(ts_langs)
			end)
		end
	end,
})

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
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- these icons are used inside of the oil view
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

	-- defined in config.keymaps so every binding lives in one file
	-- this file returns the table named oil
	keymaps = require("config.keymaps").oil,
})

-- oil only opens a preview when asked. re-open it on every oil buffer so the
-- split survives navigating into a subdirectory.
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	desc = "always show the oil preview split",
	callback = vim.schedule_wrap(function(args)
		local oil = require("oil")
		-- only act from the oil window itself
		if vim.api.nvim_get_current_buf() ~= args.data.buf then
			return
		end
		-- never fire while focus sits in the preview window
		if vim.wo.previewwindow then
			return
		end
		-- oil already debounces its own cursor moved previews. open_preview is
		-- async and restores focus to whatever window was current when it was
		-- called, so a second overlapping call can capture the preview window
		-- as "previous" and leave the cursor stranded there. bail if oil has
		-- a preview open already.
		if require("oil.util").get_preview_win() then
			return
		end
		if oil.get_cursor_entry() then
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
        find_files = { hidden = true} -- telescope . files
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

-- treesitter highlighting, enabled per buffer. nvim-treesitter's `main` branch
-- only installs parsers; it never touches highlighting itself. pcall means a
-- missing or ABI-stale parser silently falls back to the regex syntax file
-- instead of throwing on every buffer open.
vim.api.nvim_create_autocmd("FileType", {
    desc = "start treesitter highlighting when a parser exists",
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if lang and pcall(vim.treesitter.start, ev.buf, lang) then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})
