_G.NVIM_START = vim.uv.hrtime()

require('config.keymaps')
require('config.options')
require('config.autocmds')
require('config.plugins')

require("config.statusline").setup()

vim.opt.termguicolors = true
vim.cmd.colorscheme("734")
