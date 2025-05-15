-- return { 
--     "shaunsingh/nord.nvim",
-- 	name = "nord",
-- 	config = function()
-- 		vim.cmd("colorscheme nord")
--
-- 		    vim.cmd([[
-- 		 	hi Normal guibg=NONE ctermbg=NONE
-- 		 	hi NormalNC guibg=NONE ctermbg=NONE
-- 		 	hi LineNr guibg=NONE ctermbg=NONE
-- 		 	hi SignColumn guibg=NONE ctermbg=NONE
-- 		 	hi Folded guibg=NONE ctermbg=NONE
-- 		 	hi NonText guibg=NONE ctermbg=NONE
-- 		 	hi VertSplit guibg=NONE ctermbg=NONE
-- 		 	hi EndOfBuffer guibg=NONE ctermbg=NONE
-- 		 ]])
-- 	end
-- }


return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false,
        terminal = true,
        overrides = {
          LineNr = { fg = "#999999" }, -- light gray line numbers
        },
      })
      vim.cmd("colorscheme ayu")
    end,
  },
}
