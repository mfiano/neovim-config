local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 80,
    })
  }
}
