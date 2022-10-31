local util = require("lib/util")

local group = vim.api.nvim_create_augroup
local group_opts = { clear = true }
local cmd = vim.api.nvim_create_autocmd

-- All filetypes
local all = group("ft_all", group_opts)
cmd("filetype", { pattern = "*", command = [[set fo+=qj fo-=rol]], group = all })

-- Common Lisp
local commonlisp = group("ft_commonlisp", group_opts)
cmd({ "bufread", "bufnewfile" }, {
  pattern = "*.asd,*.ros", command = [[setfiletype = lisp]], group = commonlisp
})
cmd("filetype", { pattern = "lisp", command = [[hi link lispKey Keyword]], group = commonlisp })

-- Diff
local diff = group("ft_diff", group_opts)
cmd("filetype", {
  pattern = "diff", command = [[setl foldmethod=expr foldexpr=DiffFoldLevel()]], group = diff
})

-- Gemtext
local gemtext = group("ft_gemtext", group_opts)
cmd("filetype", { pattern = "gemtext", command = [[setl wrap lbr tw=0 wm=0]], group = gemtext })

-- GLSL
local glsl = group("ft_glsl", group_opts)
cmd("filetype", {
  pattern = "glsl", command = [[setl foldmethod=marker foldmarker={,}]], group = glsl
})

-- HTML
local html = group("ft_html", group_opts)
cmd("filetype", { pattern = "html", command = [[setl foldmethod=indent]], group = html })

-- JSON
local json = group("ft_json", group_opts)
cmd("filetype", { pattern = "json", command = [[setl foldmethod=syntax]], group = json })

-- Julia
local julia = group("ft_julia", group_opts)
cmd("bufwritepre", { pattern = "*.jl", callback = vim.lsp.buf.format, group = julia })
cmd("filetype", { pattern = "julia", command = [[setl sw=4 et tw=100]], group = julia })
cmd("filetype", {
  pattern = "julia",
  callback = util.bind_term_cmd("<localleader>;", "julia", "direnv exec . jl"),
  group = julia
})

-- Markdown
local markdown = group("ft_markdown", group_opts)
cmd("filetype", { pattern = "markdown", command = [[setl autowriteall fo+=tw2]], group = markdown })
cmd("filetype", {
  pattern = "markdown",
  callback = util.bind_term_cmd("<localleader>;", "markdown", "glow %s"),
  group = markdown
})

-- Rust
-- local rust = group("ft_rust", group_opts)

-- Vim
local vim_options = group("vim_options", group_opts)
cmd("vimleave", { command = [[set guicursor=a:hor25]], group = vim_options })
cmd({ "winleave", "insertenter" }, { command = [[set nocursorline]], group = vim_options })
cmd({ "winenter", "insertleave" }, { command = [[set cursorline]], group = vim_options })
cmd("vimresized", { command = [[wincmd =]], group = vim_options })
cmd("termopen", { command = [[setl nonumber]], group = vim_options })
cmd("insertenter", { command = [[set listchars-=trail:⌴]], group = vim_options })
cmd("insertleave", { command = [[set listchars+=trail:⌴]], group = vim_options })
cmd("bufreadpost", {
  pattern = "quickfix", command = [[nnoremap <buffer><cr> <cr>]], group = vim_options
})

-- YAML
local yaml = group("ft_yaml", group_opts)
cmd("filetype", { pattern = "yaml", command = [[setl indentkeys=<:>]], group = yaml })
