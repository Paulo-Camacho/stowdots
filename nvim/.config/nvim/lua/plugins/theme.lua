return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nord") -- Nord doesn't need a setup function
    end,
  },
}
