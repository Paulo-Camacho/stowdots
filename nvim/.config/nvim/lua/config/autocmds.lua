local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("user-config", { clear = true })

autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
	desc = "autosave on leaving insert, normal-mode edits, focus loss, buffer switch",
	group = group,
	callback = function(args)
		local bo = vim.bo[args.buf]
		-- only real, named, writable files: no help, quickfix, terminal, ...
		if
			bo.modified
			and bo.modifiable
			and not bo.readonly
			and bo.buftype == ""
			and vim.api.nvim_buf_get_name(args.buf) ~= ""
		then
			vim.api.nvim_buf_call(args.buf, function() vim.cmd("silent! update") end)
		end
	end,
})

autocmd("TextYankPost", {
	desc = "flash yanked text",
	group = group,
	callback = function() vim.hl.on_yank({ timeout = 100 }) end,
})

autocmd("FileType", {
	desc = "q closes help and quickfix windows",
	group = group,
	pattern = { "help", "qf" },
	callback = function(args) vim.keymap.set("n", "q", "<C-w>c", { buffer = args.buf, desc = "close window" }) end,
})

autocmd("BufReadPost", {
	desc = "reopen a file where you left off",
	group = group,
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local in_range = mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(args.buf)
		-- a commit message always starts at the top
		if in_range and vim.bo[args.buf].filetype ~= "gitcommit" then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
