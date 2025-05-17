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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- options: "storm", "moon", "night", "day"
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
      })
      vim.cmd("colorscheme tokyonight-storm")
    end,
  },
}
