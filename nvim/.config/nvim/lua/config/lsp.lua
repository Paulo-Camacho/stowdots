-- LSP. nvim 0.12 resolves servers itself: nvim-lspconfig ships `lsp/<name>.lua`
-- config files, vim.lsp.enable() turns them on, and mason-lspconfig calls
-- vim.lsp.enable() for every server mason has installed.

-- servers mason installs for us. clangd is deliberately absent: macOS already
-- ships one at /usr/bin/clangd that knows about the SDK headers, and a mason
-- copy would shadow it.
local ensure_servers = {
	"lua_ls",
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"jsonls",
	"bashls",
	"marksman",
}

-- formatters/linters, installed by mason-tool-installer and driven by conform
local ensure_tools = {
	"stylua",
	"clang-format",
	"prettier",
	"ruff",
	"shfmt",
}

require("mason").setup({
	ui = { border = "rounded" },
})

require("mason-tool-installer").setup({
	ensure_installed = ensure_tools,
	run_on_start = true,
	auto_update = false,
})

-- every server inherits blink's completion capabilities (snippets, resolve
-- support, label details). `*` is the wildcard config vim.lsp merges first.
local ok_blink, blink = pcall(require, "blink.cmp")
vim.lsp.config("*", {
	capabilities = ok_blink and blink.get_lsp_capabilities({}, false) or nil,
})

-- per-server overrides layered on top of nvim-lspconfig's defaults
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = { checkThirdParty = false },
			-- stop it asking which library `vim` comes from on every config file
			diagnostics = { globals = { "vim", "MiniIcons" } },
			completion = { callSnippet = "Replace" },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
	init_options = { clangdFileStatus = true },
})

require("mason-lspconfig").setup({
	ensure_installed = ensure_servers,
	automatic_enable = true, -- calls vim.lsp.enable() for what mason installed
})

-- system clangd, outside mason's inventory
vim.lsp.enable("clangd")

-- diagnostics: signs in the gutter, virtual text on the right, worst first
vim.diagnostic.config({
	severity_sort = true,
	underline = { severity = vim.diagnostic.severity.ERROR },
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	float = {
		border = "rounded",
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘ ",
			[vim.diagnostic.severity.WARN] = "▲ ",
			[vim.diagnostic.severity.INFO] = "» ",
			[vim.diagnostic.severity.HINT] = "⚑ ",
		},
	},
})

-- rounded borders on hover/signature popups
vim.o.winborder = "rounded"

-- buffer-local keymaps. these live here rather than in config.keymaps because
-- they only exist once a server actually attaches to the buffer.
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP buffer-local keymaps and inlay hints",
	callback = function(ev)
		local buf = ev.buf
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
		end

		local function pick(name, opts)
			return function()
				require("telescope.builtin")[name](opts or {})
			end
		end

		map("n", "gd", pick("lsp_definitions"), "goto definition")
		map("n", "gr", pick("lsp_references"), "goto references")
		map("n", "gI", pick("lsp_implementations"), "goto implementation")
		map("n", "gy", pick("lsp_type_definitions"), "goto type definition")
		map("n", "gD", vim.lsp.buf.declaration, "goto declaration")
		map("n", "<leader>ss", pick("lsp_document_symbols"), "document symbols")
		map("n", "<leader>sS", pick("lsp_dynamic_workspace_symbols"), "workspace symbols")

		map("n", "K", vim.lsp.buf.hover, "hover docs")
		map({ "i", "n" }, "<C-s>", vim.lsp.buf.signature_help, "signature help")
		map("n", "<leader>cr", vim.lsp.buf.rename, "rename symbol")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "code action")
		map("n", "<leader>cd", vim.diagnostic.open_float, "line diagnostics")

		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- clangd only: jump between foo.c and foo.h
		if client and client.name == "clangd" then
			map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", "switch source/header")
		end

		-- inlay hints off by default; <leader>uh toggles them (config.keymaps)
		if client and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(false, { bufnr = buf })
		end

		-- highlight other uses of the symbol under the cursor
		if client and client:supports_method("textDocument/documentHighlight") then
			local group = vim.api.nvim_create_augroup("lsp-highlight-" .. buf, { clear = true })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				group = group,
				buffer = buf,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = group,
				buffer = buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
