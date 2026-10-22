local map = vim.keymap.set
vim.g.mapleader = " "

-- ergonomic
map("n", ";", ":", { desc = "enter command mode with ;" })

-- exit insert mode with jk
map("i", "jk", "<ESC>")

-- mapping end of line and start of line to H and L (ergonomic)
map({ "n", "v" }, "H", "_")
map({ "n", "v" }, "L", "$")

-- remember when toast did with the date command and then used something to read it into neovim?
-- map("n", "<leader>pd", "<cmd>pu=strftime('%c')<CR>", { desc = "Pasting today's date" })
-- shout out Bread On Penguins! (:r <shell command here>)
map("n", "<leader>pd", "<cmd>r!date<CR>", { desc = "Using terminal date command and injecting into Neovim" })
-- print tick box -- 
map("n", "<leader>pt", "0i- [ ] ", { noremap = true, silent = true, desc = "Insert a TODO tick box" })
-- print check tick box -- 
map("n", "<leader>px", "F[lrx<ESC>", { noremap = true, silent = true, desc = "Check a TODO tick box" })

-- move entire lines --
-- map("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected line up"})
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected line down"})

-- moving visually selected lines via JK
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move line up" })

-- wrapped line navigation --
-- bare j/k walk display lines; a count (5j) still jumps real lines to match the gutter
-- mode list omits operator-pending on purpose so dj/yj keep working on whole real lines
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down by display line" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up by display line" })


-- buffer
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "buffer next" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "buffer previous" })
map("n", "<leader>bk", "<cmd>bdelete<CR>", { desc = "buffer kill" })


-- telescope
-- wrapped in functions: keymaps.lua loads before plugins.lua, so telescope
-- is not on the runtimepath yet at this point
-- make sure that inside of init.lua plugins are loaded before keymap if you want to delete this helper function
-- GREP KEYMAPS
local function pick(name)
	return function()
		require("telescope.builtin")[name]()
	end
end
map("n", "<leader>.", pick("find_files"), { desc = "find files" })
map("n", "<leader>/", pick("live_grep"), { desc = "grep dir you opened nvim in" })
map("n", "<leader>sr", pick("oldfiles"), { desc = "recent files" })
-- find files under the current buffer's dir (oil's dir when inside oil),
-- falling back to cwd for unnamed buffers
map("n", "<leader><leader>", function()
	local ok, oil = pcall(require, "oil")
	local dir = ok and oil.get_current_dir() or vim.fn.expand("%:p:h")
	if dir == "" then dir = vim.uv.cwd() end
	require("telescope.builtin").find_files({
		cwd = dir,
		prompt_title = "files in " .. vim.fn.fnamemodify(dir, ":~"),
	})
end, { desc = "find files in buffer's dir" })
map("n", "<leader>l", pick("buffers"), { desc = "buffer list" })
map("n", "<leader>bb", pick("buffers"), { desc = "open buffers" })
map("n", "<leader>sh", pick("help_tags"), { desc = "search help" })
map("n", "<leader>sk", pick("keymaps"), { desc = "search keymaps" })
map("n", "<leader>sd", pick("diagnostics"), { desc = "search diagnostics" })
map("n", "<leader>r", pick("resume"), { desc = "resume last picker" })

-- a toggle, same split view as `nvim .`. a bare `:Oil` from inside oil opens
-- the parent dir, so pressing it again walked up a level each time; from the
-- preview window it opened a second explorer there.
map("n", "<leader>e", function()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "oil" and not vim.wo[win].previewwindow then
			vim.api.nvim_set_current_win(win)
			require("oil").close()
			return
		end
	end
	require("oil").open()
end, { desc = "file explorer" })

-- ===========================================================================
-- the omarchy / LazyVim layer
-- ===========================================================================
-- plugin keymaps are wrapped in functions for the same reason the telescope
-- ones above are: this file is required before config.plugins runs.

map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "clear search highlight" })


-- buffers
map("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current and vim.bo[buf].buflisted then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end, { desc = "buffer close others" })

map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "quit all" })

-- more telescope. <leader>sg is omarchy's "Space S G"; <leader>/ above is the
-- same picker under the LazyVim name.
map("n", "<leader>sg", pick("live_grep"), { desc = "grep workspace" })
map("n", "<leader>sw", pick("grep_string"), { desc = "grep word under cursor" })
map("n", "<leader>sb", pick("current_buffer_fuzzy_find"), { desc = "search in buffer" })
map("n", "<leader>sc", pick("commands"), { desc = "search commands" })
map("n", "<leader>sm", pick("marks"), { desc = "search marks" })
map("n", "<leader>sq", pick("quickfix"), { desc = "search quickfix" })
map("n", "<leader>gc", pick("git_commits"), { desc = "git commits" })
map("n", "<leader>gt", pick("git_status"), { desc = "git status" })

-- git: lazygit in a float, the "Space G G" from the omarchy manual
map("n", "<leader>gg", function() require("snacks").lazygit() end, { desc = "lazygit" })
map("n", "<leader>gl", function() require("snacks").lazygit.log() end, { desc = "lazygit log" })

-- terminal float, and a way back out of it
map({ "n", "t" }, "<C-/>", function() require("snacks").terminal.toggle() end, { desc = "toggle terminal" })
map({ "n", "t" }, "<C-_>", function() require("snacks").terminal.toggle() end, { desc = "toggle terminal (tmux sends C-_)" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "leave terminal mode" })

-- flash: hop anywhere on screen with two keys
map({ "x", "o" }, "s", function() require("flash").jump() end, { desc = "flash jump" })
map({ "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "flash treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "remote flash" })

-- diagnostics + quickfix
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "next diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "prev diagnostic" })
map("n", "]e", function()
	vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
end, { desc = "next error" })
map("n", "[e", function()
	vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })
end, { desc = "prev error" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics (workspace)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "diagnostics (buffer)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "symbols" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "location list" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix list" })
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "todo comments" })
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "search todo comments" })

-- ------------------------------------------------------------ multicursor --
-- <C-d> is VSCode's "add the next occurrence of this word to the selection":
-- press it once to put a cursor on the word under the cursor, again for the
-- next match, and keep going. `c`, `d`, `i` and friends then run at every
-- cursor. <Esc> collapses back to one.
--
-- this takes <C-d> away from half-page-down. <C-f>/<C-b> still page, and
-- <C-u> still scrolls up half a page.
local function mc(fn, ...)
	local args = { ... }
	return function()
		require("multicursor-nvim")[fn](unpack(args))
	end
end

map({ "n", "x" }, "<C-d>", mc("matchAddCursor", 1), { desc = "cursor at next match" })
map({ "n", "x" }, "<leader>mD", mc("matchAddCursor", -1), { desc = "cursor at previous match" })
map({ "n", "x" }, "<leader>md", mc("matchSkipCursor", 1), { desc = "skip this match" })
-- VSCode's ctrl+shift+L: one cursor on every occurrence in the buffer at once
map({ "n", "x" }, "<leader>ma", mc("matchAllAddCursors"), { desc = "cursor on every match" })
-- a column of cursors, like alt+click-dragging down a gutter
map({ "n", "x" }, "<leader>mj", mc("lineAddCursor", 1), { desc = "add cursor below" })
map({ "n", "x" }, "<leader>mk", mc("lineAddCursor", -1), { desc = "add cursor above" })
map({ "n", "x" }, "<leader>ms", mc("splitCursors"), { desc = "split selection by regex" })
map("x", "<leader>mv", mc("visualToCursors"), { desc = "cursor on each selected line" })
-- park every extra cursor without losing them; <Esc> then brings them back
map({ "n", "x" }, "<C-q>", mc("toggleCursor"), { desc = "freeze/unfreeze cursors" })
map("n", "<leader>mr", mc("restoreCursors"), { desc = "restore the last cursor set" })

-- click to place extra cursors
map("n", "<C-LeftMouse>", mc("handleMouse"), { desc = "add cursor at click" })
map("n", "<C-LeftDrag>", mc("handleMouseDrag"), { desc = "drag a cursor selection" })
map("n", "<C-LeftRelease>", mc("handleMouseRelease"), { desc = "finish cursor drag" })

-- code
map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "format buffer/selection" })
map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "mason (lsp/tool installer)" })

-- ---------------------------------------------------------------- toggles --
-- <leader>u is the LazyVim toggle prefix. these are the ones worth having.
local function toggle_opt(opt, name)
	return function()
		vim.opt_local[opt] = not vim.opt_local[opt]:get()
		vim.notify(name .. ": " .. tostring(vim.opt_local[opt]:get()))
	end
end

map("n", "<leader>uw", toggle_opt("wrap", "wrap"), { desc = "toggle wrap" })
map("n", "<leader>ul", toggle_opt("number", "number"), { desc = "toggle line numbers" })
map("n", "<leader>uL", toggle_opt("relativenumber", "relativenumber"), { desc = "toggle relative numbers" })
map("n", "<leader>us", toggle_opt("spell", "spell"), { desc = "toggle spell" })
map("n", "<leader>uc", toggle_opt("cursorline", "cursorline"), { desc = "toggle cursorline" })

-- omarchy ships LazyVim with format-on-save off; this is the switch
map("n", "<leader>uf", function()
	vim.g.autoformat = not vim.g.autoformat
	vim.notify("format on save: " .. tostring(vim.g.autoformat))
end, { desc = "toggle format on save" })

map("n", "<leader>ud", function()
	local on = not vim.diagnostic.is_enabled()
	vim.diagnostic.enable(on)
	vim.notify("diagnostics: " .. tostring(on))
end, { desc = "toggle diagnostics" })

map("n", "<leader>sp", function()
	local on = not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(on, { bufnr = 0 })
	vim.notify("inlay hints: " .. tostring(on))
end, { desc = "toggle inlay hints" })

map("n", "<leader>un", function() require("snacks").notifier.hide() end, { desc = "dismiss notifications" })

-- the two 734 variants, swapped in place. omarchy does this from the system
-- theme; here it is a key.
map("n", "<leader>ct", function()
	local light = vim.g.colors_name == "734-light"
	vim.cmd.colorscheme(light and "734" or "734-light")
end, { desc = "toggle light/dark theme" })


-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "window left" })
map("n", "<C-j>", "<C-w>j", { desc = "window down" })
map("n", "<C-k>", "<C-w>k", { desc = "window up" })
map("n", "<C-l>", "<C-w>l", { desc = "window right" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "taller window" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "shorter window" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "narrower window" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "wider window" })

-- oil's own buffer-local keymaps. these are plain data (action names as
-- strings), so they carry no dependency on oil being loaded -- plugins.lua
-- reads this table and hands it to oil.setup().
local M = {}

M.oil = {
	["<CR>"] = "actions.select",
	["-"] = { "actions.parent", mode = "n" },
	["<Esc>"] = { "actions.close", mode = "n" },
	["q"] = { "actions.close", mode = "n" },
	["<C-p>"] = "actions.preview",
	["<C-d>"] = "actions.preview_scroll_down",
	["<C-u>"] = "actions.preview_scroll_up",
	["."] = { "actions.toggle_hidden", mode = "n" },
}

return M
