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

function M.check_back_space()
  local col = fn.col '.' - 1
  return col == 0 or fn.getline('.'):sub(col, col):match '%s' ~= nil
end

function M.get_config(name)
  return string.format([[require("config/%s")]], name)
end

function M.bind_term_cmd(key, title, command, autoclose)
  local term_cmd = "FloatermNew --title=%s --autoclose=%s %s"
  autoclose = autoclose and 1 or 0
  return function()
    vim.keymap.set("n", key, function()
      local path = fn.expand("%:p")
      vim.cmd(string.format(term_cmd, title, autoclose, string.gsub(command, "%%[s]", path)))
    end,
    { buffer = true })
  end
end

return M
