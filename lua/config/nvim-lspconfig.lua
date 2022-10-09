local util = require("util")

vim.diagnostic.config({
  virtual_text = true
})

-- Bash
require("lspconfig").bashls.setup({
  on_attach = util.lsp_attach,
})

-- CSS
require("lspconfig").cssls.setup({
  on_attach = util.lsp_attach,
})

-- GLSL
require("lspconfig").glslls.setup({
  on_attach = util.lsp_attach,
})

-- HTML
require("lspconfig").html.setup({
  on_attach = util.lsp_attach,
})

-- JavaScript/TypeScript
require("lspconfig").eslint.setup({
  on_attach = util.lsp_attach,
})

-- JSON
require("lspconfig").jsonls.setup({
  on_attach = util.lsp_attach,
})

-- Julia
require("lspconfig").julials.setup({
  on_attach = util.lsp_attach,
  on_new_config = function(new_config, _)
    local julia = vim.fn.expand("~/.data/julia/environments/nvim-lspconfig/bin/julia")
    if require("lspconfig").util.path.is_file(julia) then
      new_config.cmd[1] = julia
    end
  end
})

-- Lua
require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}

-- Markdown
require("lspconfig").marksman.setup({
  on_attach = util.lsp_attach,
})

-- TeX
require("lspconfig").texlab.setup({
  on_attach = util.lsp_attach,
})

-- YAML
require("lspconfig").yamlls.setup({
  on_attach = util.lsp_attach,
})
