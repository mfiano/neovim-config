local cmp = require("cmp")
local util = require("lib/util")

cmp.setup {
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end
  },
  mapping = cmp.mapping.preset.insert({
    ["<c-pageup>"] = cmp.mapping.scroll_docs(-4),
    ["<c-pagedown>"] = cmp.mapping.scroll_docs(4),
    ["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif util.check_back_space() then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<s-tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" })
  }),
  sources = {
    { name = "buffer" },
    { name = "omni" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "latex_symbols" },
    { name = "nvim_lua" }
  }
}

require("cmp_nvim_lsp").default_capabilities()
