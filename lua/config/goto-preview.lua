require("goto-preview").setup{
  height = 20
}

local map = vim.keymap.set
local opts = { silent = true }

map("n", "gd", function() require("goto-preview").goto_preview_definition() end, opts)
map("n", "gr", function() require("goto-preview").goto_preview_references() end, opts)
