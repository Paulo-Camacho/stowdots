-- you want to lazy load to avoid neovim trying to run a program that still needs to be loaded
-- parsers treesitter should keep installed
local ts_langs = {
	"c", "cpp", "python", "html", "css", "javascript", "typescript", "tsx",
	"json", "jsonc", "jsdoc", "lua", "luadoc", "vim", "vimdoc", "markdown",
	"markdown_inline", "bash", "diff", "git_config", "gitcommit", "gitignore",
	"make", "cmake", "query", "regex", "toml", "yaml", "xml",
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
	-- files, finding, syntax
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-lua/plenary.nvim", -- required by telescope
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- optional, big speedup
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },

	-- lsp: nvim-lspconfig only ships lsp/*.lua configs for vim.lsp.enable();
	-- mason installs the servers, mason-lspconfig wires the two together
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

	-- completion. pinned to the v1 tag range so blink downloads a prebuilt
	-- fuzzy-matcher binary instead of needing a local cargo build
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1") },
	"https://github.com/rafamadriz/friendly-snippets",

	-- formatting
	"https://github.com/stevearc/conform.nvim",

	-- editor / ui, the omarchy (LazyVim) layer
	"https://github.com/folke/snacks.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/ts-comments.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.surround",
	-- the 1.0 branch is the one the author supports; main is the dev branch
	{ src = "https://github.com/jake-stewart/multicursor.nvim", version = "1.0" },
})

-- these icons are used inside of the oil view
require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons() -- telescope looks for nvim-web-devicons

-- oil
-- an oil buffer is a file list, not text. oil's own defaults already drop the
-- sign/fold columns, but not `number` or snacks' statuscolumn, so `nvim .`
-- rendered line numbers down the side of the directory listing. cursorline
-- goes back on here (it is off globally) because in a list the cursor *is*
-- the selection.
local oil_win_options = {
	number = false,
	relativenumber = false,
	statuscolumn = "",
	signcolumn = "no",
	foldcolumn = "0",
	cursorline = true,
	cursorcolumn = false,
	wrap = false,
	list = false,
	spell = false,
	conceallevel = 3,
	concealcursor = "nvic",
	fillchars = "eob: ", -- no ~ tildes past the last entry
}

-- the directory oil is showing, as a breadcrumb, for the winbar and the float
-- title. `~` stands in for $HOME and the last component is the one you are in.
local function oil_breadcrumb(bufnr)
	local ok, dir = pcall(require("oil").get_current_dir, bufnr)
	if not ok or not dir then
		return ""
	end
	local pretty = vim.fn.fnamemodify(dir:gsub("/$", ""), ":~")
	local parts = vim.split(pretty, "/", { trimempty = true })
	if pretty:sub(1, 1) == "~" then
		parts[1] = "~"
	end
	return parts
end

-- winbar is re-evaluated on every redraw, so this has to be cheap and has to
-- work out which window it is drawing for -- vim.g.statusline_winid, the same
-- trick config.statusline uses.
function _G.oil_winbar()
	local win = vim.g.statusline_winid
	local buf = win and vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) or 0
	local parts = oil_breadcrumb(buf)
	if type(parts) ~= "table" or #parts == 0 then
		return ""
	end

	-- a deep path would push the folder you are actually in off the right edge,
	-- so keep the last few components and mark the cut. %< then lets vim shave
	-- the leading ones further if the window is still too narrow.
	local max_parts = 4
	local trimmed = false
	if #parts > max_parts then
		parts = vim.list_slice(parts, #parts - max_parts + 1)
		trimmed = true
	end

	local out = { "%#OilWinbarIcon# 󰉋 %<" }
	if trimmed then
		table.insert(out, "%#OilWinbarSep#… › ")
	end
	for idx, part in ipairs(parts) do
		if idx == #parts then
			table.insert(out, "%#OilWinbarCurrent#" .. part)
		else
			table.insert(out, "%#OilWinbarPath#" .. part .. "%#OilWinbarSep# › ")
		end
	end
	table.insert(out, "%#OilWinbarPath# %*")
	return table.concat(out)
end

local function set_oil_hl()
	-- derived from the theme rather than hardcoded, so <leader>ub still works
	vim.api.nvim_set_hl(0, "OilWinbarIcon", { link = "Directory" })
	vim.api.nvim_set_hl(0, "OilWinbarPath", { link = "Comment" })
	vim.api.nvim_set_hl(0, "OilWinbarSep", { link = "NonText" })
	vim.api.nvim_set_hl(0, "OilWinbarCurrent", { link = "Directory", bold = true })
	-- nvim_set_hl ignores `bold` next to `link`, so set the bold one properly
	local dir = vim.api.nvim_get_hl(0, { name = "Directory", link = false })
	vim.api.nvim_set_hl(0, "OilWinbarCurrent", { fg = dir.fg, bold = true })
end
set_oil_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "keep the oil winbar readable after a theme swap",
	callback = set_oil_hl,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	desc = "breadcrumb winbar on oil windows",
	callback = function()
		-- the float already carries the breadcrumb in its border title, so a
		-- winbar there would print the same path twice, one line apart
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return
		end
		vim.opt_local.winbar = "%{%v:lua.oil_winbar()%}"
	end,
})

require("oil").setup({
	default_file_explorer = true, -- replaces netrw
	win_options = oil_win_options,

	view_options = {
		show_hidden = true,
		case_insensitive = true, -- sort Downloads next to docs, not before it
		-- dotfiles are worth seeing; macOS turd files are not
		is_always_hidden = function(name)
			return name == ".DS_Store"
		end,
	},

	float = {
		preview_split = "right", -- list on the left, preview on the right
		padding = 1,             -- was 2; less of the buffer underneath shows through
		max_width = 0.96,
		max_height = 0.92,
		border = "rounded",
		win_options = { winblend = 0 }, -- fully opaque
		-- the float has no winbar of its own, so the breadcrumb goes in the
		-- border title instead
		get_win_title = function(winid)
			local parts = oil_breadcrumb(vim.api.nvim_win_get_buf(winid))
			if type(parts) ~= "table" or #parts == 0 then
				return ""
			end
			return " 󰉋  " .. table.concat(parts, " › ") .. " "
		end,
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
			statuscolumn = "",
			signcolumn = "no",
			cursorline = false,
			wrap = false,
			fillchars = "eob: ",
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
		-- park the cursor on a real entry first. oil lands on line 1, which is
		-- `../`, so the preview would fill with the parent directory -- your
		-- whole home folder, when you open oil from the dashboard. this runs
		-- before the preview check below because `--preview` has already opened
		-- one by now; moving the cursor is what refreshes it
		-- (preview_win.update_on_cursor_moved). navigating up with `-` is
		-- unaffected: there oil puts the cursor on the directory you came from.
		local entry = oil.get_cursor_entry()
		if entry and entry.name == ".." and vim.api.nvim_buf_line_count(args.data.buf) > 1 then
			pcall(vim.api.nvim_win_set_cursor, 0, { 2, 0 })
			entry = oil.get_cursor_entry()
		end

		-- oil already debounces its own cursor moved previews. open_preview is
		-- async and restores focus to whatever window was current when it was
		-- called, so a second overlapping call can capture the preview window
		-- as "previous" and leave the cursor stranded there. bail if oil has
		-- a preview open already.
		if require("oil.util").get_preview_win() then
			return
		end

		if entry then
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

-- the rest of the environment, split by concern. these all run after
-- vim.pack.add() above, so every plugin is already on the runtimepath.
require("config.lsp")
require("config.completion")
require("config.format")
require("config.editor")
