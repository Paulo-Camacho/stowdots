local opt = vim.opt

opt.number = true          -- line number (<leader>ul toggles it)
-- opt.relativenumber = true  -- relative line numbers; omarchy keeps these off,
opt.cursorline = true
                              -- and the toggle is <leader>uL
opt.tabstop = 4            -- number of spaces a tab counts for
opt.shiftwidth = 4         -- number of spaces for auto-indents
opt.expandtab = true       -- convert tabs to white spaces
opt.smartcase = true       -- case-sensitive search if capital letter is typed
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

-- ---------------------------------------------------------------------------
-- the omarchy / LazyVim layer
-- ---------------------------------------------------------------------------
opt.signcolumn = "yes"     -- always reserve it, so git signs and diagnostics
                           -- never shove the text sideways mid-edit
opt.updatetime = 200       -- CursorHold fires this fast: lsp document highlight
opt.timeoutlen = 400       -- how long which-key waits before showing its popup
opt.scrolloff = 4          -- keep context above/below the cursor
opt.sidescrolloff = 8
opt.undofile = true        -- undo survives closing the file
opt.undolevels = 10000
opt.ignorecase = true      -- smartcase (already on) only bites with this set
opt.confirm = true         -- ask instead of failing on :q with unsaved changes
opt.splitkeep = "screen"   -- opening a split does not scroll the text you read
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 12         -- cap the completion menu instead of covering the file
opt.inccommand = "nosplit" -- live preview of :s///
opt.list = true            -- snacks' indent guides read better with these on
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
opt.fillchars:append({ eob = " " }) -- no ~ column past the last line, which
                                    -- is mostly visible on the dashboard and
                                    -- behind the oil float
-- omarchy sets both of these in its LazyVim config: no relative numbers, and
-- format-on-save off by default (the toggle is <leader>uf, see config.format)
opt.relativenumber = false

-- session-ish niceties for a machine with real tooling on it
vim.g.markdown_recommended_style = 0 -- stop the ftplugin forcing 4-space tabs
