-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_light",

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "",
    "",
    "                      ,dPYb, ,dPYb,",
    "                      IP'`Yb IP'`Yb",
    "                 gg   I8  8I I8  8I",
    "                      I8  8' I8  8'",
    " gg    gg    gg  gg   I8 dP  I8 dP ",
    " I8    I8    88  88   I8dP   I8dP  ",
    " I8    I8    8I  88   I8P    I8P   ",
    " ''Y88P''Y88P' 8P''Y88P''Y888P''Y88",
    "",
  },
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

-- M.nvdash = {
--   load_on_startup = true,
--   header = {
--     "",
--     "",
--     "",
--     "",
--     "",
--     "                                   ",
--     "                      _/  _/  _/   ",
--     " _/      _/      _/      _/  _/    ",
--     "_/      _/      _/  _/  _/  _/     ",
--     " _/  _/  _/  _/    _/  _/  _/      ",
--     "  _/      _/      _/  _/  _/       ",
--     "                                   ",
--     "",
--     "",
--     "",
--   },
-- }
