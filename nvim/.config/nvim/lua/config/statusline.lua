-- :h statusline to see options
local M = {}

-- name, hl group. Colors are the theme's job: these are the mode groups
-- colorschemes define for statuslines, and the bar itself is StatusLine
local modes = {
	n = { "normal", "MiniStatuslineModeNormal" },
	nt = { "normal", "MiniStatuslineModeOther" },
	i = { "insert", "MiniStatuslineModeInsert" },
	ic = { "insert", "MiniStatuslineModeInsert" },
	v = { "visual", "MiniStatuslineModeVisual" },
	V = { "v-line", "MiniStatuslineModeVisual" },
	["\22"] = { "v-block", "MiniStatuslineModeVisual" },
	c = { "command", "MiniStatuslineModeCommand" },
	R = { "replace", "MiniStatuslineModeReplace" },
	t = { "terminal", "MiniStatuslineModeOther" },
}

function M.mode()
	local mode = vim.api.nvim_get_mode().mode
	local m = modes[mode] or { mode, "StatusLine" }
	return ("%%#%s# %s %%*"):format(m[2], m[1])
end

function M.diagnostics()
	local n = vim.diagnostic.count(0)
	local errors, warnings = n[vim.diagnostic.severity.ERROR], n[vim.diagnostic.severity.WARN]
	if not errors and not warnings then
		return " no errors "
	end
	return (errors and "%#DiagnosticError# errors:" .. errors .. "%*" or "")
		.. (warnings and "%#DiagnosticWarn# warnings:" .. warnings .. "%*" or "")
end

-- cwd's own name plus the path under it (nvim/lua/config/init.lua), or the
-- real path with $HOME as ~ for files outside cwd
function M.filepath()
	local name = vim.api.nvim_buf_get_name(0)
	if name == "" then
		return "[No Name]"
	end
	local cwd = vim.fn.getcwd()
	local rel = vim.fs.relpath(cwd, name)
	return rel and vim.fn.fnamemodify(cwd, ":t") .. "/" .. rel or vim.fn.fnamemodify(name, ":~")
end

function M.setup()
	-- %{%...%} re-reads the result as statusline items (for the %#hl# codes);
	-- plain %{...} inserts the path as text, so a % in a filename is safe.
	-- %< marks where to truncate first, so a long path loses leading
	-- directories instead of the filename
	local sl = "v:lua.require'config.statusline'."
	vim.o.statusline = "%{%"
		.. sl
		.. "mode()%} "
		.. "%{%"
		.. sl
		.. "diagnostics()%} "
		.. "%<%{"
		.. sl
		.. "filepath()} %r%m"
		-- shiftwidth() is the effective indent: it resolves sw=0 to tabstop
		.. "%=%{&expandtab ? 'spaces' : 'tabs'}:%{shiftwidth()}  %{&filetype}  %3l:%-2c "
end

return M
