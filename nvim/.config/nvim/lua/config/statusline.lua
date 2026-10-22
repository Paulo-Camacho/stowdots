-- :h statusline to see options
local M = {}

-- name, hl group. the *Bold groups are built in setup()
local modes = {
	n = { 'normal', 'Bold' },
	nt = { 'normal', 'Removed' },
	i = { 'insert', 'StringBold' },
	ic = { 'insert', 'StringBold' },
	v = { 'visual', 'LabelBold' },
	V = { 'v-line', 'LabelBold' },
	['\22'] = { 'v-block', 'LabelBold' },
	c = { 'command', 'FunctionBold' },
	R = { 'replace', 'WarningMsgBold' },
	t = { 'terminal', 'RemovedBold' },
}

function M.mode()
	local mode = vim.api.nvim_get_mode().mode
	local m = modes[mode] or { mode, 'StatusLine' }
	return ('%%#%s# %s %%*'):format(m[2], m[1])
end

function M.diagnostics()
	local n = vim.diagnostic.count(0)
	local errors, warnings = n[vim.diagnostic.severity.ERROR], n[vim.diagnostic.severity.WARN]
	if not errors and not warnings then return ' no errors ' end
	return (errors and '%#DiagnosticError# errors:' .. errors .. '%*' or '')
		.. (warnings and '%#DiagnosticWarn# warnings:' .. warnings .. '%*' or '')
end

-- cwd's own name plus the path under it (nvim/lua/config/init.lua), or the
-- real path with $HOME as ~ for files outside cwd
function M.filepath()
	local name = vim.api.nvim_buf_get_name(0)
	if name == '' then return '[No Name]' end
	local cwd = vim.fn.getcwd()
	local rel = vim.fs.relpath(cwd, name)
	return rel and vim.fn.fnamemodify(cwd, ':t') .. '/' .. rel or vim.fn.fnamemodify(name, ':~')
end

function M.setup()
	-- the hl groups are derived from the theme, so rebuild them on every swap
	local function set_hl()
		vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
		vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })
		for _, group in ipairs({ 'String', 'Label', 'Function', 'WarningMsg', 'Removed' }) do
			local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
			vim.api.nvim_set_hl(0, group .. 'Bold', { fg = hl.fg, bg = hl.bg, bold = true })
		end
	end
	set_hl()
	vim.api.nvim_create_autocmd('ColorScheme', {
		desc = 'rebuild statusline hl groups after a theme swap',
		callback = set_hl,
	})

	-- %{%...%} re-reads the result as statusline items (for the %#hl# codes);
	-- plain %{...} inserts the path as text, so a % in a filename is safe.
	-- %< marks where to truncate first, so a long path loses leading
	-- directories instead of the filename
	local sl = "v:lua.require'config.statusline'."
	vim.o.statusline = '%{%' .. sl .. 'mode()%} '
		.. '%{%' .. sl .. 'diagnostics()%} '
		.. '%<%{' .. sl .. 'filepath()} %r%m'
		.. '%=%{&filetype}  %3l:%-2c '
end

return M
