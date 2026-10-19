_G.NVIM_START = vim.uv.hrtime()

require('config.keymaps')
require('config.options')
require('config.autocmds')
require('config.plugins')

require("config.statusline").setup()

vim.opt.termguicolors = true

-- dev mode: load 734 from the local repo and hot-reload on change.
-- NVIM_734_DEV=0 nvim falls back to the vim.pack copy.
local theme_dev = vim.fn.expand("~/Projects/734")
if vim.env.NVIM_734_DEV ~= "0" and vim.uv.fs_stat(theme_dev) then
	vim.opt.rtp:prepend(theme_dev)

	local function reload()
		package.loaded.theme734 = nil
		local name = vim.g.colors_name
		if name and name:match("^734") then
			pcall(vim.cmd.colorscheme, name)
		end
	end

	local pending = vim.uv.new_timer()
	for _, sub in ipairs({ "colors", "lua" }) do
		local w = vim.uv.new_fs_event()
		w:start(theme_dev .. "/" .. sub, {}, function()
			-- debounce: one save can fire several events
			pending:stop()
			pending:start(50, 0, vim.schedule_wrap(reload))
		end)
	end
end

vim.cmd.colorscheme("734")
