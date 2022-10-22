local fn = vim.fn
local cmd = vim.cmd

local M = {}

function M.smart_home()
  local first_non_blank = fn.match(fn.getline("."), "\\S") + 1
  if first_non_blank == 0 then
    return (fn.col(".") + 1 >= fn.col("$")) and cmd("normal 0") or cmd("normal ^")
  end
  if fn.col(".") == first_non_blank then
    return cmd("normal 0")
  end
  return (vim.opt.wrap == true and fn.wincol() > 1) and cmd("normal g^") or cmd("normal ^")
end

function M.julia_repl_cmd()
  local project_name = fn.split(fn.expand('%:p'), "/")[5]
  if project_name then
    return "direnv exec ~/projects/Julia/" .. project_name .. " jl"
  else
    return ""
  end
end

function M.check_back_space()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

function M.get_config(name)
  return string.format('require("config/%s")', name)
end

return M
