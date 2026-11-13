-- plugin list (vim.pack) and treesitter. every other plugin is configured in
-- its own config.* module, required at the bottom.

-- parsers treesitter should keep installed
-- stylua: ignore
local ts_langs = {
	"c", "cpp", "python", "html", "css", "javascript", "typescript", "tsx",
	"json", "jsonc", "jsdoc", "lua", "luadoc", "vim", "vimdoc", "markdown",
	"markdown_inline", "bash", "diff", "git_config", "gitcommit", "gitignore",
	"make", "cmake", "query", "regex", "toml", "yaml", "xml", "java",
}

-- build hooks must be registered BEFORE vim.pack.add(), or they miss the install
vim.api.nvim_create_autocmd("PackChanged", {
	desc = "plugin build steps",
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if kind == "delete" then
			return
		end
		if name == "nvim-treesitter" then
			-- deferred: this fires from inside vim.pack.add(), before the plugin
			-- is on the runtimepath, so require() here would fail
			vim.schedule(function() require("nvim-treesitter").install(ts_langs) end)
		elseif name == "telescope-fzf-native.nvim" then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	-- files, finding, syntax
	"https://github.com/stevearc/oil.nvim",
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
	"https://github.com/nvim-mini/mini.pairs",
	-- the 1.0 branch is the one the author supports; main is the dev branch
	{ src = "https://github.com/jake-stewart/multicursor.nvim", version = "1.0" },

	-- colorscheme (734 + 734-light), loaded by init.lua
	"git@github.com:Paulo-Camacho/734.git",
})

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

-- these all run after vim.pack.add() above, so every plugin is already on
-- the runtimepath
require("config.oil")
require("config.telescope")
require("config.lsp")
require("config.completion")
require("config.format")
require("config.editor")
require("config.pairs") -- after completion: it wraps a blink function
