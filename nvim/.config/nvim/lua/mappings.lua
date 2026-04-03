require "nvchad.mappings"

local map = vim.keymap.set
local api = vim.api.nvim_set_keymap

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- telescope -- 
map("n", "<leader>.", "<Cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })

map("n", "<leader>bk", "<Cmd>bwipeout<CR>", { desc = "kill current buffer" })

map("n", "<leader>fm", require("telescope.builtin").marks, { desc = "telescope marks" })

-- MACROS --
-- print the working date --
-- remember when toast did with the date command and then used something to read it into neovim?
-- map("n", "<leader>pd", "<cmd>pu=strftime('%c')<CR>", { desc = "Pasting today's date" })

-- Shout out Bread On Penguins! ( this injects the date command into neovim )
map("n", "<leader>pd", "<cmd>r!date<CR>", { desc = "Using terminal date command and injecting into Neovim" })

map("n", "-", "<cmd>Nvdash<CR>", { desc = "Open Dashboard" })

-- print tick box -- 
map("n", "<leader>pc", "0i- [ ] ", { noremap = true, silent = true, desc = "Insert a TODO tick box" })
-- print check tick box -- 
map("n", "<leader>px", "F[lrx<ESC>", { noremap = true, silent = true, desc = "Check a TODO tick box" })

-- move entire lines --
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected line up"}) 
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected line down"})
map("n", ";", ":", { desc = "CMD enter command mode" })

