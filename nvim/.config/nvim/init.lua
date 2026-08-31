require('config.keymaps')
require('config.options')
require('config.autocmds')

require('onedarkpro').setup() -- loading theme
vim.cmd.colorscheme('onedark')           -- applying

-- Coloring the Cursorline
vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "#2c313c",
})
-- vim.cmd.colorscheme('onedark_dark')   -- Black background
-- vim.cmd.colorscheme('onedark_vivid')  -- More saturated
-- vim.cmd.colorscheme('onelight')       -- Light
-- vim.cmd.colorscheme('vaporwave')      -- Purple/pink
