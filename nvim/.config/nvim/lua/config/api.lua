-- Spell check in md --
vim.api.nvim_create_autocmd("FileType", 
{
	pattern = "markdown",
	command = "setlocal spell wrap",
})

-- Highlight on yank --
vim.api.nvim_create_autocmd("TextYankPost", 
{
	pattern = "*",
	callback = function()
	vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Remeber where cursor was before closing --
vim.api.nvim_create_autocmd("BufReadPost", 
{
	pattern = "*",
	callback = function()
	local line = vim.fn.line("'\"")
	if line > 1 and line <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end,
})
