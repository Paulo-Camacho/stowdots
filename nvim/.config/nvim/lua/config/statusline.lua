-- hl pattern: %#HLGroup#text%*
-- :h statusline to see options
local hi_pattern = '%%#%s#%s%%*'

local cmp = {
	mode = function()
		local mode = vim.api.nvim_get_mode().mode
		local modes = {
			n = 'NORMAL',
			i = 'INSERT',
			ic = 'INSERT',
			v = 'VISUAL',
			V = 'V-LINE',
			['\22'] = 'V-BLOCK',
			c = 'COMMAND',
			R = 'REPLACE',
			t = 'TERMINAL',
			nt = 'NORMAL'
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
		local ok = ' cwd => '
		local ignore = { ['c'] = true, ['t'] = true }
		local mode = vim.api.nvim_get_mode().mode
		if ignore[mode] then return ok end

		local levels = vim.diagnostic.severity
		local errors = #vim.diagnostic.get(0, { severity = levels.ERROR })
		local warnings = #vim.diagnostic.get(0, { severity = levels.WARN })

		local result = ''
		if errors > 0 then
			result = result .. hi_pattern:format('DiagnosticError', ' ✘ ' .. errors)
		end
		if warnings > 0 then
			result = result .. hi_pattern:format('DiagnosticWarn', ' ▲ ' .. warnings)
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
		-- set the hl groups
		-- TODO: rerun on every theme change
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

		for _, group in ipairs({ "String", "Label", "Function", "WarningMsg", "Removed" }) do
			local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
			if ok then
				vim.api.nvim_set_hl(0, group .. "Bold", { fg = hl.foreground, bg = hl.background or "NONE", bold = true })
			end
		end
		-- build the statusline
		local statusline = {
			'%{%v:lua._statusline_component("mode")%} ',
			'%{%v:lua._statusline_component("diagnostic_status")%} ',
			-- %< marks where to truncate first, so a long path loses leading
			-- directories instead of the filename
			'%<%{%v:lua._statusline_component("filepath")%} ',
			'%r', '%m',
			'%=',
			'%{&filetype} ',
			'%{%v:lua._statusline_component("position")%}'
		}
		-- to unalias stuff
		function _G._statusline_component(name)
			return _G._statusline_cmp[name]()
		end

		vim.o.statusline = table.concat(statusline, '')
		vim.o.laststatus = 2
	end
}
_G._statusline_cmp = cmp
return cmp
