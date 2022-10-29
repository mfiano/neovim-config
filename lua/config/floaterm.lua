vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
vim.g.floaterm_width = 0.5
vim.g.floaterm_height = 0.9
vim.g.floaterm_position = "right"
vim.g.floaterm_autoclose = 2

-- Mappings

local map = vim.keymap.set
local opts = { silent = true }

map("n", "<a-cr>", ":FloatermNew<cr>", opts)
map("n", "<a-tab>", ":FloatermToggle<cr>", opts)
map("i", "<a-tab>", "<esc>:FloatermToggle<cr>", opts)
map("t", "<a-tab>", "<c-\\><c-n>:FloatermToggle<cr>", opts)
map("n", "<a-pageup>", ":FloatermPrev<cr>", opts)
map("i", "<a-pageup>", "<esc>:FloatermPrev<cr>", opts)
map("t", "<a-pageup>", "<c-\\><c-n>:FloatermPrev<cr>", opts)
map("n", "<a-pagedown>", ":FloatermNext<cr>", opts)
map("i", "<a-pagedown>", "<esc>:FloatermNext<cr>", opts)
map("t", "<a-pagedown>", "<c-\\><c-n>:FloatermNext<cr>", opts)
