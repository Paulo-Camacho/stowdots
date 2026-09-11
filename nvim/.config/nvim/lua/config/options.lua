local opt = vim.opt

-- opt.number = true          -- Show absolute line number of current line
-- opt.relativenumber = true  -- Show relative line numbers for easier jumping
opt.tabstop = 4            -- Number of spaces a tab counts for
opt.shiftwidth = 4         -- Number of spaces for auto-indents
opt.expandtab = true       -- Convert tabs to white spaces
opt.smartcase = true       -- Case-sensitive search if capital letter is typed
opt.cursorline = true      -- Highlight the current line
opt.termguicolors = true   -- Enable 24-bit RGB terminal colors
opt.wrap = true            -- Enable visual wrapping
opt.linebreak = true       -- Wrap at word boundaries
opt.textwidth = 0          -- Prevent Neovim from inserting physical line breaks
opt.clipboard = "unnamedplus" -- Share Neovim clipboard with the system clipboard
opt.virtualedit = "all" -- allows you to navigate wrapped lines like if they were discrete lines

-- new splits open right / below instead of left / above. oil's preview uses
-- these when it opens in a normal window (`nvim .`), the way float.preview_split
-- controls it in the floating explorer.
opt.splitright = true
opt.splitbelow = true
