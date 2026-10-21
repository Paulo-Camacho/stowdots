-- hl pattern: %#HLGroup#text%*
-- :h statusline to see options
local hi_pattern = '%%#%s#%s%%*'

local cmp = {
	mode = function()
		local mode = vim.api.nvim_get_mode().mode
		local modes = {
			n = 'normal',
			i = 'insert',
			ic = 'insert',
			v = 'visual',
			V = 'v-line',
			['\22'] = 'v-block',
			c = 'command',
			R = 'replace',
			t = 'terminal',
			nt = 'normal'
		}
		local name = modes[mode] or mode

		local hl = {
			n = 'Bold',
			i = 'StringBold',
			ic = 'StringBold',
			v = 'LabelBold',
			V = 'LabelBold',
			['\22'] = 'LabelBold',
			c = 'FunctionBold',
			R = 'WarningMsgBold',
			nt = 'Removed',
			t = 'RemovedBold'
		}

		return hi_pattern:format(hl[mode] or 'StatusLine', ' ' .. name .. ' ')
	end,


	diagnostic_status = function()
		local ok = ' no errors '
		local ignore = { ['c'] = true, ['t'] = true }
		local mode = vim.api.nvim_get_mode().mode
		if ignore[mode] then return ok end

		local levels = vim.diagnostic.severity
		local errors = #vim.diagnostic.get(0, { severity = levels.ERROR })
		local warnings = #vim.diagnostic.get(0, { severity = levels.WARN })

		local result = ''
		if errors > 0 then
			-- result = result .. hi_pattern:format('DiagnosticError', ' ✘ ' .. errors)
			result = result .. hi_pattern:format('DiagnosticError', ' errors:' .. errors)
		end
		if warnings > 0 then
			-- result = result .. hi_pattern:format('DiagnosticWarn', ' ▲ ' .. warnings)
			result = result .. hi_pattern:format('DiagnosticWarn', ' warnings:' .. warnings)
		end
		if result == '' then
			result = ok
		end
		return result
	end,


	position = function()
		return ' %3l:%-2c '
	end,


	filepath = function()
		local name = vim.api.nvim_buf_get_name(0)
		if name == '' then return '[No Name]' end

		local cwd = vim.fn.getcwd()
		local rel = vim.fs.relpath(cwd, name)
		local text
		if rel then
			-- cwd's own name plus the path under it, e.g. nvim/lua/config/init.lua
			text = vim.fn.fnamemodify(cwd, ':t') .. '/' .. rel
		else
			-- file lives outside cwd, so show its real path with $HOME as ~
			text = vim.fn.fnamemodify(name, ':~')
		end

		-- this runs inside %{%...%}, so the result is re-read as statusline
		-- items. a literal % in a filename would be eaten as a format code.
		return (text:gsub('%%', '%%%%'))
	end,

	setup = function()
		-- the hl groups are derived from the theme, so rebuild them on every swap
		local function set_hl()
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
			for _, group in ipairs({ "String", "Label", "Function", "WarningMsg", "Removed" }) do
				local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
				vim.api.nvim_set_hl(0, group .. "Bold", { fg = hl.fg, bg = hl.bg, bold = true })
			end
		end
		set_hl()
		vim.api.nvim_create_autocmd("ColorScheme", {
			desc = "rebuild statusline hl groups after a theme swap",
			callback = set_hl,
		})

		-- build the statusline
		local statusline = {
			'%{%v:lua._statusline_cmp.mode()%} ',
			'%{%v:lua._statusline_cmp.diagnostic_status()%} ',
			-- %< marks where to truncate first, so a long path loses leading
			-- directories instead of the filename
			'%<%{%v:lua._statusline_cmp.filepath()%} ',
			'%r', '%m',
			'%=',
			'%{&filetype} ',
			'%{%v:lua._statusline_cmp.position()%}'
		}
		vim.o.statusline = table.concat(statusline, '')
		vim.o.laststatus = 2
	end
}
_G._statusline_cmp = cmp
return cmp
