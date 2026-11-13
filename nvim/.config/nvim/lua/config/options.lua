local opt = vim.opt

-- line numbers are off; <leader>ul / <leader>uL toggle absolute / relative
opt.cursorline = true
opt.signcolumn = "yes" -- always reserved, so signs never shove the text sideways
opt.showmode = false -- the statusline shows the mode
opt.termguicolors = true

-- attach a highlight group to each cursor mode so nvim emits OSC 12 and drives
-- the cursor color itself instead of inheriting the terminal's. nonzero
-- blinkon/blinkoff asks for a blinking cursor (DECSCUSR); the fade timing is
-- kitty's (cursor_blink_interval in kitty.conf).
local blink = "-Cursor-blinkwait700-blinkon600-blinkoff600"
opt.guicursor = {
	"n-v-c-sm:block" .. blink,
	"i-ci-ve:ver25" .. blink,
	"r-cr-o:hor20" .. blink,
}

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
vim.g.markdown_recommended_style = 0 -- stop the ftplugin forcing 4-space tabs

-- wrapping: soft-wrap at word boundaries, never insert real line breaks
opt.wrap = true
opt.linebreak = true
opt.textwidth = 0
opt.virtualedit = "all" -- the cursor may sit past the end of a line

-- search
opt.ignorecase = true
opt.smartcase = true -- case-sensitive once the pattern has a capital
opt.inccommand = "nosplit" -- live preview of :s///

-- splits open right / below. oil's preview uses these in a normal window
-- (`nvim .`); float.preview_split controls it in the floating explorer.
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen" -- opening a split does not scroll the text you read

-- files
opt.clipboard = "unnamedplus" -- share the system clipboard
opt.undofile = true -- undo survives closing the file
opt.undolevels = 10000
opt.confirm = true -- ask instead of failing on :q with unsaved changes
opt.autowriteall = true -- also save on :next, :make, :!cmd, buffer switches
opt.swapfile = false -- autosave (config.autocmds) keeps the file on disk current

-- timing
opt.updatetime = 200 -- CursorHold delay: lsp document highlight
opt.timeoutlen = 400 -- how long which-key waits before showing its popup

-- ui
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.pumheight = 12 -- cap the completion menu instead of covering the file
opt.list = true -- snacks' indent guides read better with these on
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
opt.fillchars:append({ eob = " " }) -- no ~ column past the last line
