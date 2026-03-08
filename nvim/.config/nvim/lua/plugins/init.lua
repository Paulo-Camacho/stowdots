-- return {
--   {
--     "stevearc/conform.nvim",
--     opts = require "configs.conform",
--   },
--
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       require "configs.lspconfig" end, }, {
--     'MeanderingProgrammer/render-markdown.nvim',
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--     --@module 'render-markdown'
--     --@type render.md.UserConfig
--     lazy = false,
--     opts = {},
-- },
--
--    	"nvim-treesitter/nvim-treesitter",
--    	opts = {
--    		ensure_installed = {
--    			"vim", "lua", "vimdoc",
--         "html", "css"
--    		},
--    	},
-- }
return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  --   lazy = false,
  --   opts = {},
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "java",
        "python", "cpp",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
    config = function()
      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = 'rainbow-delimiters.strategy.global',
          vim = 'rainbow-delimiters.strategy.local',
          java = 'rainbow-delimiters.strategy.global',
          python = 'rainbow-delimiters.strategy.global',
          cpp = 'rainbow-delimiters.strategy.global',
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
          java = 'rainbow-delimiters',
          python = 'rainbow-delimiters',
          cpp = 'rainbow-delimiters',
        },
        priority = {
          [''] = 110,
          lua = 210,
          java = 120,
          python = 120,
          cpp = 120,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
}
