require("highlight_current_n").setup({
  highlight_group = "IncSearch"
})

-- Mappings

local map = vim.keymap.set
local opts = { silent = true }

map("n", "n", "<plug>(highlight-current-n-n)", opts)
map("n", "N", "<plug>(highlight-current-n-N)", opts)
