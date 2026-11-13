-- oil: the file explorer. `nvim .` and <leader>e open it as a split with a
-- live preview on the right; the float gets the same layout.

local oil = require("oil")

-- ------------------------------------------------------------- breadcrumb ---
-- the directory oil is showing, as path components, for the winbar and the
-- float title. `~` stands in for $HOME and the last component is the one you
-- are in. empty when the buffer is not an oil directory.
---@param bufnr integer
---@return string[]
local function breadcrumb(bufnr)
	local ok, dir = pcall(oil.get_current_dir, bufnr)
	if not ok or not dir then
		return {}
	end
	local pretty = vim.fn.fnamemodify((dir:gsub("/$", "")), ":~")
	return vim.split(pretty, "/", { trimempty = true })
end

-- winbar is re-evaluated on every redraw, so this has to be cheap and has to
-- work out which window it is drawing for, via vim.g.statusline_winid.
function _G.oil_winbar()
	local win = vim.g.statusline_winid
	local buf = win and vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) or 0
	local parts = breadcrumb(buf)
	if #parts == 0 then
		return ""
	end

	-- a deep path would push the folder you are actually in off the right edge,
	-- so keep the last few components and mark the cut. %< then lets vim shave
	-- the leading ones further if the window is still too narrow.
	local max_parts = 4
	local out = { " %<" }
	if #parts > max_parts then
		parts = vim.list_slice(parts, #parts - max_parts + 1)
		table.insert(out, "%#OilWinbarSep#… › ")
	end
	for idx, part in ipairs(parts) do
		part = part:gsub("%%", "%%%%") -- a literal % in a dir name is not a statusline item
		if idx == #parts then
			table.insert(out, "%#OilWinbarCurrent#" .. part)
		else
			table.insert(out, "%#OilWinbarPath#" .. part .. "%#OilWinbarSep# › ")
		end
	end
	table.insert(out, "%#OilWinbarPath# %*")
	return table.concat(out)
end

-- derived from the theme rather than hardcoded, so <leader>ct still works
local function set_hl()
	vim.api.nvim_set_hl(0, "OilWinbarPath", { link = "Comment" })
	vim.api.nvim_set_hl(0, "OilWinbarSep", { link = "NonText" })
	-- nvim_set_hl ignores `bold` next to `link`, so copy the color instead
	local dir = vim.api.nvim_get_hl(0, { name = "Directory", link = false })
	vim.api.nvim_set_hl(0, "OilWinbarCurrent", { fg = dir.fg, bold = true })
end
set_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "keep the oil winbar readable after a theme swap",
	callback = set_hl,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	desc = "breadcrumb winbar on oil windows",
	callback = function()
		-- the float already carries the breadcrumb in its border title, so a
		-- winbar there would print the same path twice, one line apart
		if vim.api.nvim_win_get_config(0).relative == "" then
			vim.opt_local.winbar = "%{%v:lua.oil_winbar()%}"
		end
	end,
})

-- ------------------------------------------------------------------ setup ---
-- an oil buffer is a file list, not text, so the text-editing chrome goes:
-- oil's own defaults already drop the sign/fold columns, but not snacks'
-- statuscolumn. cursorline stays on: in a list the cursor *is* the selection.
local list_win_options = {
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

local no_preview_exts = { pdf = true, png = true, jpg = true, jpeg = true, gif = true, mp4 = true }

oil.setup({
	default_file_explorer = true, -- replaces netrw
	columns = {}, -- names only, no icon column
	win_options = list_win_options,

	view_options = {
		show_hidden = true,
		case_insensitive = true, -- sort Downloads next to docs, not before it
		-- dotfiles are worth seeing; macOS turd files are not
		is_always_hidden = function(name) return name == ".DS_Store" end,
	},

	float = {
		preview_split = "right", -- list on the left, preview on the right
		padding = 1,
		max_width = 0.96,
		max_height = 0.92,
		border = "rounded",
		win_options = { winblend = 0 }, -- fully opaque
		-- the float has no winbar of its own, so the breadcrumb goes in the
		-- border title instead
		get_win_title = function(winid)
			local parts = breadcrumb(vim.api.nvim_win_get_buf(winid))
			return #parts == 0 and "" or " " .. table.concat(parts, " › ") .. " "
		end,
	},

	preview_win = {
		update_on_cursor_moved = true, -- preview follows the cursor
		preview_method = "scratch", -- syntax highlight, but no LSP attach
		disable_preview = function(filename)
			local ext = vim.fn.fnamemodify(filename, ":e"):lower()
			return no_preview_exts[ext] or vim.fn.getfsize(filename) > 1024 * 1024
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

	keymaps = {
		["<CR>"] = "actions.select",
		["-"] = { "actions.parent", mode = "n" },
		["<Esc>"] = { "actions.close", mode = "n" },
		["q"] = { "actions.close", mode = "n" },
		["<C-p>"] = "actions.preview",
		["<C-d>"] = "actions.preview_scroll_down",
		["<C-u>"] = "actions.preview_scroll_up",
		["."] = { "actions.toggle_hidden", mode = "n" },
	},
})

-- ----------------------------------------------------- always-on preview ---
-- the file list in split mode: a third of the screen, but never so narrow
-- that names get cut off
local function list_width() return math.max(30, math.floor(vim.o.columns * 0.3)) end

-- oil only opens a preview when asked. re-open it on every oil buffer so the
-- split survives navigating into a subdirectory.
local ensure_preview = vim.schedule_wrap(function(buf)
	-- only act from the oil window itself, never from the preview window
	if vim.api.nvim_get_current_buf() ~= buf or vim.wo.previewwindow then
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
	if entry and entry.name == ".." and vim.api.nvim_buf_line_count(buf) > 1 then
		pcall(vim.api.nvim_win_set_cursor, 0, { 2, 0 })
		entry = oil.get_cursor_entry()
	end

	-- oil already debounces its own cursor-moved previews. open_preview is
	-- async and restores focus to whatever window was current when it was
	-- called, so a second overlapping call can capture the preview window
	-- as "previous" and leave the cursor stranded there. bail if oil has
	-- a preview open already.
	if not entry or require("oil.util").get_preview_win() then
		return
	end

	-- oil splits 50/50 and has no width option, so shrink the list afterwards
	-- to give the preview most of the screen. floats size themselves
	-- (float.preview_split), so leave those alone.
	local oil_win = vim.api.nvim_get_current_win()
	oil.open_preview(nil, function(err)
		if not err and vim.api.nvim_win_is_valid(oil_win) and vim.api.nvim_win_get_config(oil_win).relative == "" then
			vim.api.nvim_win_set_width(oil_win, list_width())
		end
	end)
end)

-- OilEnter fires once, when oil first reads a directory
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	desc = "always show the oil preview split",
	callback = function(args) ensure_preview(args.data.buf) end,
})
-- reopening a directory oil still has loaded (<leader>e twice) skips OilEnter,
-- so catch the buffer coming back into a window too. before the first read
-- there is no entry under the cursor yet, so this is a no-op and OilEnter
-- does the work.
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "show the oil preview split when an oil buffer is reopened",
	callback = function(args)
		if vim.bo[args.buf].filetype == "oil" then
			ensure_preview(args.buf)
		end
	end,
})
