local util = require("lib/util")
local map = vim.keymap.set
local opts = { silent = true }

local function imap(shortcut, command)
  return vim.api.nvim_set_keymap("i", shortcut, command, { noremap = false, silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map("n", ";", ":")
map("n", "Q", ":q<cr>", opts)
map("n", "Y", "y$", opts)
map("n", "<c-up>", ":resize +2<cr>", opts)
map("n", "<c-down>", ":resize -2<cr>", opts)
map("n", "<c-left>", ":vertical resize -2<cr>", opts)
map("n", "<c-right>", ":vertical resize +2<cr>", opts)
map("n", "<a-t>", ":tabnew<cr>", opts)
map("n", "<a-x>", ":tabclose<cr>", opts)
map("n", "<a-1>", "1gt", opts)
map("n", "<a-2>", "2gt", opts)
map("n", "<a-3>", "3gt", opts)
map("n", "<a-4>", "4gt", opts)
map("n", "<a-5>", "5gt", opts)
map("n", "<a-6>", "6gt", opts)
map("n", "<a-7>", "7gt", opts)
map("n", "<a-8>", "8gt", opts)
map("n", "<a-9>", "9gt", opts)
map("n", "<s-up>", "<c-w><c-k>", opts)
map("n", "<s-down>", "<c-w><c-j>", opts)
map("n", "<s-left>", "<c-w><c-h>", opts)
map("n", "<s-right>", "<c-w><c-l>", opts)
map("n", "-", ":wincmd =<cr>", opts)
map("n", "n", "<plug>(highlight-current-n-n)", opts)
map("n", "N", "<plug>(highlight-current-n-N)", opts)
map("n", "<home>", util.smart_home, opts)

imap("<home>", "<c-o><home>")

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("x", "<a-up>", "'<-2<cr>gv-gv", opts)
map("x", "<a-down>", "'>+1<cr>gv-gv", opts)

map("t", "\\\\", [[<c-\><c-n>]], opts)
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

-- map({"n", "v"}, "<tab>", "za", opts)
map({"n", "i"}, "<f1>", "")
