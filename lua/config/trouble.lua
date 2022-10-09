require("trouble").setup{
  auto_open = true,
  auto_close = true,
  mode = "document_diagnostics",
}

vim.cmd[[hi TroublePreview ctermfg=0 ctermbg=11 guifg=#282c34 guibg=#61afef]]
