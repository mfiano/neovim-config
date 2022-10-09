require("goto-preview").setup{
  height = 20
}

local map = vim.keymap.set

map("n", "gd", require("goto-preview").goto_preview_definition, opts)
map("n", "gd", require("goto-preview").goto_preview_references, opts)
