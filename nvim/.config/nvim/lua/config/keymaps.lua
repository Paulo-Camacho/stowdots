local map = vim.keymap.set
vim.g.mapleader = " "

-- ergonomic
map("n", ";", ":", { desc = "enter command mode with ;" })

-- exit insert mode with jk
map("i", "jk", "<ESC>")

-- mapping end of line and start of line to H and L (ergonomic)
map({ "n", "v" }, "H", "0")
map({ "n", "v" }, "L", "$")

-- remember when toast did with the date command and then used something to read it into neovim?
-- map("n", "<leader>pd", "<cmd>pu=strftime('%c')<CR>", { desc = "Pasting today's date" })
-- shout out Bread On Penguins! (:r <shell command here>)
map("n", "<leader>pd", "<cmd>r!date<CR>", { desc = "Using terminal date command and injecting into Neovim" })
-- print tick box -- 
map("n", "<leader>pc", "0i- [ ] ", { noremap = true, silent = true, desc = "Insert a TODO tick box" })
-- print check tick box -- 
map("n", "<leader>px", "F[lrx<ESC>", { noremap = true, silent = true, desc = "Check a TODO tick box" })

-- move entire lines --
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected line up"})
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected line down"})

-- just type ; to go into command mode --
map("n", ";", ":", { desc = "CMD enter command mode" })

-- wrapped line navigation --
-- bare j/k walk display lines; a count (5j) still jumps real lines to match the gutter
-- mode list omits operator-pending on purpose so dj/yj keep working on whole real lines
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down by display line" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up by display line" })

-- when text is snaked I can still navigate that "one" line
map("n", "j", "gj", { silent = true, desc = "Down by display line" })
map("n", "k", "gk", { silent = true, desc = "Up by display line" })


-- netrw quality of life
-- map("n", "<leader>.", "<cmd>Ex<CR>", { desc = "open netrw" })

-- buffer
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "buffer next" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "buffer previous" })
map("n", "<leader>bk", "<cmd>bdelete<CR>", { desc = "buffer kill" })



-- telescope
-- wrapped in functions: keymaps.lua loads before plugins.lua, so telescope
-- is not on the runtimepath yet at this point
-- make sure that inside of init.lua plugins are loaded before keymap if you want to delete this helper function
local function pick(name)
	return function()
		require("telescope.builtin")[name]()
	end                  
end
map("n", "<leader>.", pick("find_files"), { desc = "find files" })
map("n", "<leader>/", pick("live_grep"), { desc = "grep dir you opened nvim in" })
map("n", "<leader>sr", pick("oldfiles"), { desc = "recent files" })
map("n", "<leader><leader>", pick("buffers"), { desc = "list buffers" })
map("n", "<leader>sh", pick("help_tags"), { desc = "search help" })
map("n", "<leader>sk", pick("keymaps"), { desc = "search keymaps" })
map("n", "<leader>sd", pick("diagnostics"), { desc = "search diagnostics" })
map("n", "<leader>sl", pick("resume"), { desc = "resume last picker" })

-- oil
map("n", "<leader>f", "<cmd>Oil --float --preview<cr>", { desc = "file explorer" })

-- ===========================================================================
-- the omarchy / LazyVim layer
-- ===========================================================================
-- plugin keymaps are wrapped in functions for the same reason the telescope
-- ones above are: this file is required before config.plugins runs.

-- clear the search highlight instead of just beeping
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "clear search highlight" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "window left" })
map("n", "<C-j>", "<C-w>j", { desc = "window down" })
map("n", "<C-k>", "<C-w>k", { desc = "window up" })
map("n", "<C-l>", "<C-w>l", { desc = "window right" })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "taller window" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "shorter window" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "narrower window" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "wider window" })

-- move lines without selecting first. visual K/J above already do the
-- selected-block version.
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "move line up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move line up" })

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
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "flash jump" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "flash treesitter" })
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

map("n", "<leader>uh", function()
	local on = not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(on, { bufnr = 0 })
	vim.notify("inlay hints: " .. tostring(on))
end, { desc = "toggle inlay hints" })

map("n", "<leader>un", function() require("snacks").notifier.hide() end, { desc = "dismiss notifications" })

-- the two 734 variants, swapped in place. omarchy does this from the system
-- theme; here it is a key.
map("n", "<leader>ub", function()
	local light = vim.g.colors_name == "734-light"
	vim.cmd.colorscheme(light and "734" or "734-light")
	require("config.statusline").setup() -- statusline hl groups are theme-derived
end, { desc = "toggle light/dark theme" })

-- oil's own buffer-local keymaps. these are plain data (action names as
-- strings), so they carry no dependency on oil being loaded -- plugins.lua
-- reads this table and hands it to oil.setup().
local M = {}

M.oil = {
	["<CR>"] = "actions.select",
	["-"] = { "actions.parent", mode = "n" },
	["<Esc>"] = { "actions.close", mode = "n" },
	["q"] = { "actions.close", mode = "n" },
	["<leader>f"] = { "actions.close", mode = "n" }, -- same key toggles it shut
	["<C-p>"] = "actions.preview",
	["<C-d>"] = "actions.preview_scroll_down",
	["<C-u>"] = "actions.preview_scroll_up",
	["."] = { "actions.toggle_hidden", mode = "n" },
}

return M
