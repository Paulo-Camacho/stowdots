
local opt = vim.opt

opt.number = true          -- Show absolute line number of current line
opt.relativenumber = true  -- Show relative line numbers for easier jumping
opt.tabstop = 4            -- Number of spaces a tab counts for
opt.shiftwidth = 4         -- Number of spaces for auto-indents
opt.expandtab = true       -- Convert tabs to white spaces
opt.smartcase = true       -- Case-sensitive search if capital letter is typed
opt.termguicolors = true   -- Enable 24-bit RGB terminal colors
opt.wrap = true            -- Enable visual wrapping
opt.linebreak = true       -- Wrap at word boundaries
opt.textwidth = 0          -- Prevent Neovim from inserting physical line breaks


-- netrw
vim.g.netrw_sort_by = "time"          -- Sort files by modification time
vim.g.netrw_sort_direction = "reverse"  -- Put newest files at the top


