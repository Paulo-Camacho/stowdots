return { 
    "rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")

			--      vim.cmd([[
			-- 	hi Normal guibg=NONE ctermbg=NONE
			-- 	hi NormalNC guibg=NONE ctermbg=NONE
			-- 	hi LineNr guibg=NONE ctermbg=NONE
			-- 	hi SignColumn guibg=NONE ctermbg=NONE
			-- 	hi Folded guibg=NONE ctermbg=NONE
			-- 	hi NonText guibg=NONE ctermbg=NONE
			-- 	hi VertSplit guibg=NONE ctermbg=NONE
			-- 	hi EndOfBuffer guibg=NONE ctermbg=NONE
			-- ]])
	end
}
