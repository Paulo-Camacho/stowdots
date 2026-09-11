local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set

local yank_group = augroup("highlight-yank", { clear = true })

-- nice yellow highlight after hitting 'yank' commands
local function set_yank_hl()
  vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#e5c07b", fg = "#282c34" })
end
set_yank_hl()

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
    vim.highlight.on_yank({
      higroup = "YankHighlight",  -- yellow group defined above
      timeout = 500,              -- how long the flash highlight lasts in ms
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
  callback = function(args)
    -- auto insert brackets or (quotes, but not inside of markdown files)
    if vim.bo[args.buf].filetype == "markdown" then
      return
    end

    local opts = {
      buffer = args.buf,
      silent = true,
    }


    map("i", '"', '""<Left>', opts)
    map("i", "'", "''<Left>", opts)
end,
})

map("i", "(", "()<Left>", opts)
map("i", "[", "[]<Left>", opts)
map("i", "{", "{}<Left>", opts)
map("i", "`", "``<Left>", opts)
