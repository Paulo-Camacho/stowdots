-- stamped before anything else loads; the dashboard subtracts it to show how
-- long startup took (config.editor). vim.pack has no stats module of its own.
_G.NVIM_START = vim.uv.hrtime()

require('config.keymaps')
require('config.options')
require('config.autocmds')
require('config.plugins')

require("config.statusline").setup()

vim.opt.termguicolors = true
vim.cmd.colorscheme("734")
