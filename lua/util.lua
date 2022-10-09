local fn = vim.fn
local cmd = vim.cmd
local M = {}

M.smart_home = function()
  local first_non_blank = fn.match(fn.getline("."), "\\S") + 1
  if first_non_blank == 0 then
    return (fn.col(".") + 1 >= fn.col("$")) and cmd("normal 0") or cmd("normal ^")
  end
  if fn.col(".") == first_non_blank then
    return cmd("normal 0")
  end
  return (vim.opt.wrap == true and fn.wincol() > 1) and cmd("normal g^") or cmd("normal ^")
end

M.lsp_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  if client.server_capabilities.signatureHelpProvider then
    require("lsp-overloads").setup(client, {})
  end
end

M.julia_repl_cmd = function()
  local project_name = fn.split(fn.expand('%:p'), "/")[5]
  if project_name then
    return "direnv exec ~/projects/Julia/" .. project_name .. " jl"
  else
    return ""
  end
end

M.check_back_space = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

M.get_config = function(name)
  return string.format('require("config/%s")', name)
end

return M
