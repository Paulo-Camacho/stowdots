local map = vim.keymap.set
local api = vim.api.nvim_set_keymap


-- Telescope -- 
map("n", "<leader>.", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })
---SEARCH ROOT---
api('n', '<leader>sr', '<cmd>lua require("telescope.builtin").find_files({ search_dirs = { "~" } })<CR>', { noremap = true, silent = true })
---SEARCH SYSTEM---
api('n', '<leader>ss', '<cmd>lua require("telescope.builtin").live_grep({ search_dirs = { "/" } })<CR>', { noremap = true, silent = true })

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>Q", ":BufferClose!<CR>")
map("n", "<leader>U", "::bufdo bd<CR>") --close all
map('n', '<leader>vs', ':vsplit<CR>:bnext<CR>') --ver split + open next buffer

--Buffers --
map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bf", ":bnext<CR>")
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>bk", ":BufferClose<CR>")

-- Print the current date --
map("n", "<leader>pd", "<cmd>pu=strftime('%c')<cr>", { desc = "Pasting today's date" })

-- Print tick box -- 
map("n", "<leader>pt", "o- [ ] ", { noremap = true, silent = true, desc = "Insert a TODO tick box" })

-- Oil -- 
map("n", "-", "<CMD>Oil<CR>", { desc = "Open current directory with Oil"})

-- Alpha -- 
map("n", "<ESC>", "<CMD>Alpha<CR>", { desc = "Open current directory with Oil"})


-- Moving entire lines --
map("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up
map("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down


-- Comments --
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })


-- Quality of life --
map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("i", "kk", "<ESC>", { noremap = true, silent = true })
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Terminal --
map('t', '<Esc>', '<C-\\><C-n>', { desc = "Escape terminal mode" })

-- Easily navigate terminal splits
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = "Move left from terminal" })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = "Move down from terminal" })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = "Move up from terminal" })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = "Move right from terminal" })

-- Open a terminal quickly
map('n', '<Leader>tt', ':term<CR>', { desc = "Open terminal" })

-- Close terminal buffer
map('t', '<Leader>tc', '<C-\\><C-n>:bd!<CR>', { desc = "Close terminal buffer" })
