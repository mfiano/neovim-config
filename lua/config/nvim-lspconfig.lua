local map = vim.keymap.set
local nvim_lsp = require("lspconfig")

local servers = { "bashls", "glslls", "texlab" }

local flags = {
  debounce_text_changes = 150
}

local function on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  if client.server_capabilities.signatureHelpProvider then
    require("lsp-overloads").setup(client, {})
  end
  local opts = { silent = true, buffer = true }
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gd", function() require("goto-preview").goto_preview_definition({}) end, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gr", function() require("goto-preview").goto_preview_references() end, opts)
  map("n", "gt", vim.lsp.buf.type_definition, opts)
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = flags
  }
end

vim.diagnostic.config({
  virtual_text = true
})

-- Julia
nvim_lsp.julials.setup({
  on_attach = on_attach,
  on_new_config = function(new_config, _)
    local julia = vim.fn.expand("~/.data/julia/environments/nvim-lspconfig/bin/julia")
    if nvim_lsp.util.path.is_file(julia) then
      new_config.cmd[1] = julia
    end
  end
})

-- Lua
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}
