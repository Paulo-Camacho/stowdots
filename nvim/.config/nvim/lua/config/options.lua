local opt = vim.opt

-- opt.number = true          -- line number
-- opt.relativenumber = true  -- relative line numbers
opt.tabstop = 4            -- number of spaces a tab counts for
opt.shiftwidth = 4         -- number of spaces for auto-indents
opt.expandtab = true       -- convert tabs to white spaces
opt.smartcase = true       -- case-sensitive search if capital letter is typed
opt.cursorline = true      -- highlight the current line
opt.termguicolors = true   -- enable 24-bit RGB terminal colors
-- attach highlight groups to each cursor mode so Neovim emits OSC 12 and
-- drives the cursor color itself instead of inheriting the terminal's
-- nonzero blinkon/blinkoff makes Neovim ask for a *blinking* cursor (DECSCUSR);
-- the actual fade timing/easing is kitty's (cursor_blink_interval in kitty.conf)
opt.guicursor = "n-v-c-sm:block-Cursor-blinkwait700-blinkon600-blinkoff600,i-ci-ve:ver25-Cursor-blinkwait700-blinkon600-blinkoff600,r-cr-o:hor20-Cursor-blinkwait700-blinkon600-blinkoff600"
opt.wrap = true            -- enable visual wrapping
opt.linebreak = true       -- wrap at word boundaries
opt.textwidth = 0          -- prevent Neovim from inserting physical line breaks
opt.clipboard = "unnamedplus" -- share Neovim clipboard with the system clipboard
opt.virtualedit = "all" -- allows you to navigate wrapped lines like if they were discrete lines
opt.smoothscroll = true -- scrolls by screen line instead of whole wrapped line

-- new splits open right / below instead of left / above. oil's preview uses
-- these when it opens in a normal window (`nvim .`), the way float.preview_split
-- controls it in the floating explorer.
opt.splitright = true
opt.splitbelow = true
