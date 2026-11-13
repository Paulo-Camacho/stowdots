-- every global keymap. this file is required before config.plugins runs, so
-- anything that touches a plugin is wrapped in a function and resolved on
-- keypress. buffer-local maps live next to the plugin that owns the buffer.
-- "x" (visual) is used instead of "v" throughout: "v" also covers select mode,
-- where these would hijack typing over a snippet placeholder.
local map = vim.keymap.set
vim.g.mapleader = " "

-- ---------------------------------------------------------------- editing ---
map("n", ";", ":", { desc = "command mode" })
map("i", "jk", "<Esc>", { desc = "leave insert mode" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "clear search highlight" })

map({ "n", "x" }, "H", "_", { desc = "start of line" })
map({ "n", "x" }, "L", "$", { desc = "end of line" })

-- bare j/k walk display lines; a count (5j) still jumps real lines. operator-
-- pending is left out on purpose so dj/yj keep working on whole real lines.
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "down by display line" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "up by display line" })

map("x", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "move selection down" })
map("x", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "move selection up" })

map("n", "<leader>pd", "<cmd>r!date<CR>", { desc = "paste today's date" })
map("n", "<leader>pt", "0i- [ ] ", { desc = "insert a todo tick box" })
map("n", "<leader>px", "F[lrx", { desc = "check a todo tick box" })

-- ------------------------------------------------------ buffers / windows ---
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "buffer next" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "buffer previous" })
map("n", "<leader>bk", "<cmd>bdelete<CR>", { desc = "buffer kill" })
map("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current and vim.bo[buf].buflisted then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end, { desc = "buffer close others" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "quit all" })

map("n", "<C-h>", "<C-w>h", { desc = "window left" })
map("n", "<C-j>", "<C-w>j", { desc = "window down" })
map("n", "<C-k>", "<C-w>k", { desc = "window up" })
map("n", "<C-l>", "<C-w>l", { desc = "window right" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "taller window" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "shorter window" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "narrower window" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "wider window" })

-- -------------------------------------------------------------- telescope ---
local function pick(name)
	return function() require("telescope.builtin")[name]() end
end

map("n", "<leader><leader>", pick("find_files"), { desc = "find files" })
-- find files under the current buffer's dir (oil's dir when inside oil),
-- falling back to cwd for unnamed buffers
map("n", "<leader>.", function()
	local dir = require("oil").get_current_dir() or vim.fn.expand("%:p:h")
	if dir == "" then
		dir = vim.uv.cwd()
	end
	require("telescope.builtin").find_files({
		cwd = dir,
		prompt_title = "files in " .. vim.fn.fnamemodify(dir, ":~"),
	})
end, { desc = "find files in buffer's dir" })
-- <leader>/ is the LazyVim name, <leader>sg omarchy's "Space S G"
map("n", "<leader>/", pick("live_grep"), { desc = "grep workspace" })
map("n", "<leader>sg", pick("live_grep"), { desc = "grep workspace" })
map("n", "<leader>l", pick("buffers"), { desc = "buffer list" })
map("n", "<leader>bb", pick("buffers"), { desc = "buffer list" })
map("n", "<leader>r", pick("resume"), { desc = "resume last picker" })
map("n", "<leader>sr", pick("oldfiles"), { desc = "recent files" })
map("n", "<leader>sh", pick("help_tags"), { desc = "search help" })
map("n", "<leader>sk", pick("keymaps"), { desc = "search keymaps" })
map("n", "<leader>sd", pick("diagnostics"), { desc = "search diagnostics" })
map("n", "<leader>sw", pick("grep_string"), { desc = "grep word under cursor" })
map("n", "<leader>sb", pick("current_buffer_fuzzy_find"), { desc = "search in buffer" })
map("n", "<leader>sc", pick("commands"), { desc = "search commands" })
map("n", "<leader>sm", pick("marks"), { desc = "search marks" })
map("n", "<leader>sq", pick("quickfix"), { desc = "search quickfix" })
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "search todo comments" })
map("n", "<leader>gc", pick("git_commits"), { desc = "git commits" })
map("n", "<leader>gt", pick("git_status"), { desc = "git status" })

-- -------------------------------------------------------------------- oil ---
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

-- ------------------------------------------------------ git / terminal ---
map("n", "<leader>gg", function() require("snacks").lazygit() end, { desc = "lazygit" })
map("n", "<leader>gl", function() require("snacks").lazygit.log() end, { desc = "lazygit log" })

-- tmux sends <C-_> for <C-/>
for _, lhs in ipairs({ "<C-/>", "<C-_>" }) do
	map({ "n", "t" }, lhs, function() require("snacks").terminal.toggle() end, { desc = "toggle terminal" })
end
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "leave terminal mode" })

-- ------------------------------------------------------------------ flash ---
map({ "x", "o" }, "s", function() require("flash").jump() end, { desc = "flash jump" })
map({ "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "flash treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "remote flash" })

-- ------------------------------------------------- diagnostics / quickfix ---
local function diagnostic_jump(count, severity)
	return function() vim.diagnostic.jump({ count = count, float = true, severity = severity }) end
end

map("n", "]d", diagnostic_jump(1), { desc = "next diagnostic" })
map("n", "[d", diagnostic_jump(-1), { desc = "prev diagnostic" })
map("n", "]e", diagnostic_jump(1, vim.diagnostic.severity.ERROR), { desc = "next error" })
map("n", "[e", diagnostic_jump(-1, vim.diagnostic.severity.ERROR), { desc = "prev error" })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics (workspace)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "diagnostics (buffer)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "symbols" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "location list" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix list" })
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "todo comments" })

-- ------------------------------------------------------------ multicursor ---
-- <C-d> is VSCode's "add the next occurrence of this word to the selection":
-- press it once to put a cursor on the word under the cursor, again for the
-- next match, and keep going. `c`, `d`, `i` and friends then run at every
-- cursor. <Esc> collapses back to one.
--
-- this takes <C-d> away from half-page-down. <C-f>/<C-b> still page, and
-- <C-u> still scrolls up half a page.
local function mc(fn, ...)
	local args = { ... }
	return function() require("multicursor-nvim")[fn](unpack(args)) end
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

map("n", "<C-LeftMouse>", mc("handleMouse"), { desc = "add cursor at click" })
map("n", "<C-LeftDrag>", mc("handleMouseDrag"), { desc = "drag a cursor selection" })
map("n", "<C-LeftRelease>", mc("handleMouseRelease"), { desc = "finish cursor drag" })

-- ------------------------------------------------------------------- code ---
map(
	{ "n", "x" },
	"<leader>cf",
	function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
	{ desc = "format buffer/selection" }
)
map("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "mason (lsp/tool installer)" })
map(
	"n",
	"<leader>ct",
	function() vim.cmd.colorscheme(vim.g.colors_name == "734-light" and "734" or "734-light") end,
	{ desc = "toggle light/dark theme" }
)

-- ---------------------------------------------------------------- toggles ---
local function toggle_opt(name)
	return function()
		local on = not vim.opt_local[name]:get()
		vim.opt_local[name] = on
		vim.notify(name .. ": " .. tostring(on))
	end
end

map("n", "<leader>uw", toggle_opt("wrap"), { desc = "toggle wrap" })
map("n", "<leader>ul", toggle_opt("number"), { desc = "toggle line numbers" })
map("n", "<leader>uL", toggle_opt("relativenumber"), { desc = "toggle relative numbers" })
map("n", "<leader>us", toggle_opt("spell"), { desc = "toggle spell" })
map("n", "<leader>uc", toggle_opt("cursorline"), { desc = "toggle cursorline" })

-- format-on-save is off by default (config.format); this is the switch
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
