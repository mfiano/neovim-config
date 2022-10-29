local dap = require("dap")

-- Mappings

local map = vim.keymap.set
local opts = { silent = true }

map("n", ",d<up>", function() dap.step_over() end, opts)
map("n", ",d<left>", function() dap.step_out() end, opts)
map("n", ",d<right>", function() dap.step_into() end, opts)
map("n", ",db", function() dap.toggle_breakpoint() end, opts)
map("n", ",dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, opts)
map("n", ",dc", function() dap.confinue() end, opts)
map("n", ",dr", function() dap.repl.open() end, opts)
