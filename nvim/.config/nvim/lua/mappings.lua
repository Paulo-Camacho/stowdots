require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local api = vim.api.nvim_set_keymap

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- telescope -- 
map("n", "<leader>.", "<Cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })

map("n", "<leader>bx", "<Cmd>bwipeout<CR>", { desc = "kill current buffer" })

map("n", "<leader>fm", require("telescope.builtin").marks, { desc = "telescope marks" })

-- macros --
-- print the working date --

map("n", "<leader>pd", "<cmd>pu=strftime('%c')<cr>", { desc = "Pasting today's date" })

-- print tick box -- 
map("n", "<leader>pt", "0i- [ ] ", { noremap = true, silent = true, desc = "Insert a TODO tick box" })

-- move entire lines --
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected line up"}) 
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected line down"})
map("n", ";", ":", { desc = "CMD enter command mode" })
