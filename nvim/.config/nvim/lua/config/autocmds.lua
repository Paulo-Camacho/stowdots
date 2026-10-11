local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set

local yank_group = augroup("highlight-yank", { clear = true })

-- nice yellow highlight after hitting 'yank' commands
local function set_yank_hl()
  vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#e5c07b", fg = "#282c34" })
end
set_yank_hl()

local autosave_group = augroup("autosave", { clear = true })

autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
  desc = "Auto-save on leaving insert, normal-mode edits, focus loss, buffer switch",
  group = autosave_group,
  callback = function(args)
    local bo = vim.bo[args.buf]
    -- skip unnamed, readonly, special buffers (help, quickfix, terminal, etc)
    if bo.modified and bo.modifiable and not bo.readonly
      and bo.buftype == "" and vim.api.nvim_buf_get_name(args.buf) ~= "" then
      vim.api.nvim_buf_call(args.buf, function() vim.cmd("silent! update") end)
    end
  end,
})

-- re-apply after any colorscheme swap
autocmd("ColorScheme", {
  desc = "Keep yank highlight yellow after colorscheme change",
  group = yank_group,
  callback = set_yank_hl,
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = yank_group,
  callback = function()
    vim.hl.on_yank({
      higroup = "YankHighlight",  -- yellow group defined above
      timeout = 100,              -- how long the flash highlight lasts in ms
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
		desc = "opens the file were you left off",
		callback = function(args)
			local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line("$")
			local not_commit = vim.b[args.buf].filetype ~= "commit"

			if valid_line and not_commit then
				vim.cmd([[normal! g`"]])
			end
		end,
	})

autocmd("FileType", {
  pattern = "*",
  desc = "auto-close brackets everywhere, quotes everywhere but markdown",
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    map("i", "(", "()<Left>", opts)
    map("i", "[", "[]<Left>", opts)
    map("i", "{", "{}<Left>", opts)
    map("i", "`", "``<Left>", opts)

    -- apostrophes in prose make auto-paired quotes a nuisance in markdown
    if vim.bo[args.buf].filetype == "markdown" then
      return
    end

    map("i", '"', '""<Left>', opts)
    map("i", "'", "''<Left>", opts)
  end,
})
