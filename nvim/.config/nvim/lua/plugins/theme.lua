return { 
    "shaunsingh/nord.nvim",
	name = "nord",
	config = function()
		vim.cmd("colorscheme nord")

		    vim.cmd([[
		 	hi Normal guibg=NONE ctermbg=NONE
		 	hi NormalNC guibg=NONE ctermbg=NONE
		 	hi LineNr guibg=NONE ctermbg=NONE
		 	hi SignColumn guibg=NONE ctermbg=NONE
		 	hi Folded guibg=NONE ctermbg=NONE
		 	hi NonText guibg=NONE ctermbg=NONE
		 	hi VertSplit guibg=NONE ctermbg=NONE
		 	hi EndOfBuffer guibg=NONE ctermbg=NONE
		 ]])
	end
}
