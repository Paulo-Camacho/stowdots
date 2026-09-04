local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("highlight-yank", { clear = true })

-- Yellow flash color for yanked text
local function set_yank_hl()
  vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#e5c07b", fg = "#282c34" })
end
set_yank_hl()

-- Re-apply after any colorscheme swap (colorschemes run `hi clear`)
autocmd("ColorScheme", {
  desc = "Keep yank highlight yellow after colorscheme change",
  group = yank_group,
  callback = set_yank_hl,
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight",  -- yellow group defined above
      timeout = 500,              -- flash lasts 500ms
    })
  end,
})

autocmd({ "FileType" }, {
		desc = "Keymap 'q' to close help/quickfix/netrw/etc windows",
		pattern = "help,qf,netrw",
		callback = function()
			vim.keymap.set(
				"n",
				"q",
				"<C-w>c",
				{ buffer = true, desc = "Quit (or Close) help, quickfix, netrw, etc windows" }
			)
		end,
	})

	autocmd("BufReadPost", {
		desc = "Jump to last pos when opening a file",
		callback = function(args)
			local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
			local not_commit = vim.b[args.buf].filetype ~= "commit"

			if valid_line and not_commit then
				vim.cmd([[normal! g`"]])
			end
		end,
	})