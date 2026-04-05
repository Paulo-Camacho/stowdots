-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
M.nvdash = {
  load_on_startup = true,
  header = {
    "",
  },
}
}

M.ui = {
  statusline = {
    theme = "vscode_colored", 
    -- separator_style = "round",
    -- cwd = current working directory
    -- each of these correspond with what is shown on the task bar, foo is a function that I made and is called.
    order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd", "foo" },
    modules = {
      foo = function()
        return "Hello, Paulo!"
      end,
      f = "%F"
    }
  },
  tabufline = {
    lazyload = false,
  },
}
return M

