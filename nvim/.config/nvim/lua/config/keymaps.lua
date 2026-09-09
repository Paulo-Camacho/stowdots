local map = vim.keymap.set
vim.g.mapleader = " "

-- (ergonomic)
map("n", ";", ":", { desc = "enter command mode with ;" })

-- exit insert mode with jk
map("i", "jk", "<ESC>")

-- mapping end of line and start of line to H and L (ergonomic)
map({ "n", "v" }, "H", "0")
map({ "n", "v" }, "L", "$")

-- remember when toast did with the date command and then used something to read it into neovim?
-- map("n", "<leader>pd", "<cmd>pu=strftime('%c')<CR>", { desc = "Pasting today's date" })
-- Shout out Bread On Penguins! (:r <shell command here>)
map("n", "<leader>pd", "<cmd>r!date<CR>", { desc = "Using terminal date command and injecting into Neovim" })
-- print tick box -- 
map("n", "<leader>pc", "0i- [ ] ", { noremap = true, silent = true, desc = "Insert a TODO tick box" })
-- print check tick box -- 
map("n", "<leader>px", "F[lrx<ESC>", { noremap = true, silent = true, desc = "Check a TODO tick box" })

-- move entire lines --
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "shift selected line up"})
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "shift selected line down"})

-- just type ; to go into command mode --
map("n", ";", ":", { desc = "CMD enter command mode" })

-- wrapped line navigation --
-- bare j/k walk display lines; a count (5j) still jumps real lines to match the gutter
-- mode list omits operator-pending on purpose so dj/yj keep working on whole real lines
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down by display line" })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up by display line" })

-- when text is snaked I can still navigate that "one" line
map("n", "j", "gj", { silent = true, desc = "Down by display line" })
map("n", "k", "gk", { silent = true, desc = "Up by display line" })


-- netrw quality of life
map("n", "<leader>.", "<cmd>Ex<CR>", { desc = "open netrw" })

-- buffer
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "buffer next" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "buffer previous" })
map("n", "<leader>bk", "<cmd>bk<CR>", { desc = "buffer kill" })

