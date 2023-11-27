-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-------------------------------------------------------------------------------
--  NEORG AUTOCMDS
-------------------------------------------------------------------------------
-- Inspiration was found to figure out how to register motions tied to a
--   specific filetype buffer in which-key in these githu discussions:
--   https://github.com/folke/which-key.nvim/issues/71
--   https://github.com/folke/which-key.nvim/issues/135

vim.cmd("autocmd FileType norg lua whichKeyNorg()")
function whichKeyNorg()
  local wk = require("which-key")
  local buf = vim.api.nvim_get_current_buf()
  -- Set todo item prefix
  wk.register({
    ["<localleader>t"] = {
      name = "+Manage todos",
      a = "Mark as Ambiguous",
      c = "Mark as Cancelled",
      d = "Mark as Done",
      h = "Mark as On Hold",
      p = "Mark as Pending",
      i = "Mark as Important",
      r = "Mark as Recurring",
      u = "Mark as Undone",
    },
  })
  -- List manipuation prefix
  wk.register({
    ["<localleader>l"] = {
      name = "+Manage list",
      l = "Invert list",
      t = "Toggle list",
    },
  })
  -- Add new note
  wk.register({
    ["<localleader>n"] = {
      name = "+New",
      n = "New Note",
    },
  })
  -- Insert date
  wk.register({
    ["<localleader>i"] = {
      name = "+Insert",
      d = "(NOT SET) Insert Date",
      m = { "<cmd>Neorg inject-metadata<cr>", "Insert Metadata", buffer = buf },
    },
  })
  -- Change traversal mode
  wk.register({
    ["<localleader>m"] = {
      name = "+File Traversal",
      n = "Traverse normally",
      h = "Traverse by heading",
      l = "Traverse by links",
    },
  })
  -- Export to file
  wk.register({
    ["<localleader>e"] = {
      name = "+Export",
      f = { "<cmd>Neorg export to-file<cr>", "To file" },
      d = { "<cmd>Neorg export directory<cr>", "To directory" },
    },
  })
  -- Export to file
  wk.register({
    ["<localleader>g"] = { "<cmd>Neorg generate-workspace-summary<cr>", "Generate workspace summary" },
  })
end
