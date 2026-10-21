-- conform.nvim: formatting.
--
-- format-on-save is OFF by default, the way omarchy ships LazyVim
-- (`vim.g.autoformat = false`). <leader>uf toggles it, <leader>cf formats the
-- buffer by hand. the toggle is global, so it survives switching buffers.
vim.g.autoformat = false

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		lua = { "stylua" },
		python = { "ruff_format" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
	},

	-- conform asks this before every write; returning nil skips formatting
	format_on_save = function(buf)
		if not vim.g.autoformat or vim.b[buf].autoformat == false then
			return nil
		end
		return { timeout_ms = 1000, lsp_format = "fallback" }
	end,

	formatters = {
		-- 4-space indents for C and shell (vim itself uses 2, see config.options)
		clang_format = {
			prepend_args = { "--style={BasedOnStyle: llvm, IndentWidth: 4}" },
		},
		shfmt = {
			prepend_args = { "-i", "4" },
		},
	},
})

-- :Format works on a range too, so `:'<,'>Format` formats a selection
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	conform.format({ async = true, lsp_format = "fallback", range = range })
end, { range = true, desc = "format buffer or range" })
