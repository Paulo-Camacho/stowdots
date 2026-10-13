-- the omarchy/LazyVim editor layer: hunks, hints, hops, hunting TODOs.
-- global keymaps for these live in config.keymaps; anything buffer-local
-- stays here, next to the plugin that creates the buffer.

-- ---------------------------------------------------------------- snacks ---
-- snacks is a bundle. only the pieces that do not duplicate oil/telescope are
-- on: picker and explorer stay off, and `scroll` is off the way omarchy ships
-- it (lua/plugins/snacks-animated-scrolling-off.lua).
require("snacks").setup({
	bigfile = { enabled = true },   -- strip treesitter/lsp off huge files
	quickfile = { enabled = true }, -- render the file before plugins load
	indent = { enabled = true, scope = { enabled = false } }, -- indent guides, no current-scope highlight
	input = { enabled = true },     -- pretty vim.ui.input, used by lsp rename
	notifier = { enabled = true, timeout = 3000 },
	scope = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },     -- ]] / [[ between lsp references
	lazygit = { enabled = true },
	terminal = { enabled = true },

	scroll = { enabled = true },   -- omarchy: no smooth-scroll animation
	picker = { enabled = false },   -- telescope owns this
	explorer = { enabled = false }, -- oil owns this
	dashboard = {
		enabled = true,
		preset = {
			keys = {
				{ icon = " ", key = "f", desc = "Find file", action = ":lua require('telescope.builtin').find_files()" },
				{ icon = " ", key = "n", desc = "New file", action = ":ene | startinsert" },
				{ icon = " ", key = "g", desc = "Grep", action = ":lua require('telescope.builtin').live_grep()" },
				{ icon = " ", key = "r", desc = "Recent files", action = ":lua require('telescope.builtin').oldfiles()" },
				{ icon = " ", key = "e", desc = "File explorer", action = ":Oil" },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			-- snacks' built-in "startup" section requires lazy.nvim -- it calls
			-- require("lazy.stats") and throws inside UIEnter without it, which
			-- killed the whole dashboard. vim.pack can answer the same question.
			function()
				local ms = (vim.uv.hrtime() - (_G.NVIM_START or vim.uv.hrtime())) / 1e6
				local loaded = 0
				for _, plugin in ipairs(vim.pack.get()) do
					if plugin.active then
						loaded = loaded + 1
					end
				end
				return {
					align = "center",
					padding = 1,
					text = {
						{ "󱐋 ", hl = "special" },
						{ ("%d plugins"):format(loaded), hl = "footer" },
						{ ("  in %.0fms"):format(ms), hl = "footer" },
					},
				}
			end,
		},
	},
})

-- ------------------------------------------------------------- which-key ---
local wk = require("which-key")
wk.setup({
	preset = "helix",
	delay = 400,
	icons = { mappings = false }, -- the descriptions already say enough
})
wk.add({
	{ "<leader>b", group = "buffer" },
	{ "<leader>c", group = "code" },
	{ "<leader>g", group = "git" },
	{ "<leader>m", group = "multicursor" },
	{ "<leader>p", group = "print/paste" },
	{ "<leader>s", group = "search" },
	{ "<leader>u", group = "toggle ui" },
	{ "<leader>x", group = "diagnostics/quickfix" },
	{ "g", group = "goto" },
	{ "]", group = "next" },
	{ "[", group = "prev" },
})

-- -------------------------------------------------------------- gitsigns ---
require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "▁" },
		topdelete = { text = "▔" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},
	on_attach = function(buf)
		local gs = require("gitsigns")
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
		end

		-- hunk navigation. inside a diff buffer ]c/[c already do this, so fall
		-- back to them rather than fighting vim's own mapping.
		map("n", "]h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gs.nav_hunk("next")
			end
		end, "next hunk")
		map("n", "[h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gs.nav_hunk("prev")
			end
		end, "prev hunk")

		map({ "n", "v" }, "<leader>gs", gs.stage_hunk, "stage hunk")
		map({ "n", "v" }, "<leader>gr", gs.reset_hunk, "reset hunk")
		map("n", "<leader>gS", gs.stage_buffer, "stage buffer")
		map("n", "<leader>gR", gs.reset_buffer, "reset buffer")
		map("n", "<leader>gp", gs.preview_hunk_inline, "preview hunk")
		map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "blame line")
		map("n", "<leader>gd", gs.diffthis, "diff this")
	end,
})

-- ----------------------------------------------------------------- flash ---
-- two-character hops. `s` used to be substitute; `cl` still does that.
require("flash").setup({
	modes = {
		-- leave / and ? alone: incremental search already works the way it does
		search = { enabled = false },
	},
})

-- --------------------------------------------------------------- trouble ---
require("trouble").setup({ focus = true })

-- --------------------------------------------------------- todo-comments ---
require("todo-comments").setup({ signs = true })

-- ------------------------------------------------------------ ts-comments ---
-- nvim 0.12 comments with gc already; this only teaches it the right comment
-- string for embedded languages (jsx inside tsx, lua inside vimscript, ...)
require("ts-comments").setup({})

-- ------------------------------------------------------------ mini pieces ---
-- better a/i textobjects: ci( works across lines, va) picks the nearest pair,
-- plus `f` for a function call and `a` for an argument
require("mini.ai").setup({ n_lines = 500 })

-- surround, under `gs` so it does not eat flash's `s`
require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "gsn",
	},
})

-- ----------------------------------------------------------- multicursor ---
local mc = require("multicursor-nvim")
mc.setup()

-- mappings that only exist while there is more than one cursor, so they can
-- overlap with the global ones (<Esc> normally just clears the search highlight)
mc.addKeymapLayer(function(layer)
	layer({ "n", "x" }, "<left>", mc.prevCursor, { desc = "previous cursor" })
	layer({ "n", "x" }, "<right>", mc.nextCursor, { desc = "next cursor" })
	layer({ "n", "x" }, "<leader>mx", mc.deleteCursor, { desc = "delete this cursor" })
	-- first <Esc> re-enables disabled cursors, second one drops back to a
	-- single cursor. matches how <C-q> parks them.
	layer("n", "<Esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end, { desc = "clear cursors" })
end)

local function set_multicursor_hl()
	-- reverse video reads as a real cursor in both 734 variants; the rest ride
	-- on groups the colorscheme already defines
	vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
	vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
	vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
	vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
	vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { reverse = true, bold = true })
	vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
	vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
end
set_multicursor_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "keep the extra cursors visible after a theme swap",
	callback = set_multicursor_hl,
})

-- ------------------------------------------- treesitter textobjects (main) ---
-- the `main` branch exposes plain lua functions instead of installing its own
-- mappings, so the keymaps are spelled out here.
local ok_to, textobjects = pcall(require, "nvim-treesitter-textobjects")
if ok_to then
	textobjects.setup({
		select = { lookahead = true },
		move = { set_jumps = true },
	})

	local select = require("nvim-treesitter-textobjects.select")
	local move = require("nvim-treesitter-textobjects.move")

	local function sel(lhs, obj, desc)
		vim.keymap.set({ "x", "o" }, lhs, function()
			select.select_textobject(obj, "textobjects")
		end, { desc = desc, silent = true })
	end

	sel("af", "@function.outer", "a function")
	sel("if", "@function.inner", "inner function")
	sel("ac", "@class.outer", "a class")
	sel("ic", "@class.inner", "inner class")
	sel("al", "@loop.outer", "a loop")
	sel("il", "@loop.inner", "inner loop")
	sel("a/", "@comment.outer", "a comment")

	local function goto_map(lhs, fn, obj, desc)
		vim.keymap.set({ "n", "x", "o" }, lhs, function()
			move[fn](obj, "textobjects")
		end, { desc = desc, silent = true })
	end

	goto_map("]f", "goto_next_start", "@function.outer", "next function")
	goto_map("[f", "goto_previous_start", "@function.outer", "prev function")
	goto_map("]c", "goto_next_start", "@class.outer", "next class")
	goto_map("[c", "goto_previous_start", "@class.outer", "prev class")
end
