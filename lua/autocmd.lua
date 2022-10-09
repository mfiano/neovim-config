local util = require("util")
local group = vim.api.nvim_create_augroup
local group_opts = { clear = true }
local cmd = vim.api.nvim_create_autocmd
local fn = vim.fn
local floaterm = function() return [[nnoremap <buffer> <localleader>; :execute ':FloatermNew ]] end

-- Common Lisp
local commonlisp = group("ft_commonlisp", group_opts)
cmd({"bufread", "bufnewfile"}, {
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

-- JavaScript
local js = group("ft_javascript", group_opts)
cmd("bufwritepre", { pattern = "*.js,*.jsx", command = "EsLintFixAll", group = js })

-- JSON
local json = group("ft_json", group_opts)
cmd("filetype", { pattern = "json", command = [[setl foldmethod=syntax]], group = json })

-- Julia
local julia = group("ft_julia", group_opts)
cmd("bufwritepre", { pattern = "*.jl", callback = vim.lsp.buf.formatting_sync, group = julia })
cmd("filetype", {
  pattern = "julia",
  command = [[setl sw=4 et tw=100]],
  group = julia
})
cmd("filetype", {
  pattern = "julia",
  command = floaterm() .. "--title=julia  " .. util.julia_repl_cmd() .. "'<cr>",
  group = julia
})

-- Markdown
local markdown = group("ft_markdown", group_opts)
cmd("filetype", { pattern = "markdown.pandoc", command = [[setl autowriteall]], group = markdown })
cmd("filetype", {
  pattern = "markdown.pandoc",
  command = floaterm() .. "--title=markdown --autoclose=0 " .. fn.expand('glow %:p') .. "'<cr>",
  group = markdown
})
cmd({"bufnewfile", "buffilepre", "bufread" }, {
  pattern = "*.md", command = [[setl filetype=markdown.pandoc foldlevel=1]], group = markdown
})

-- TypeScript
local typescript = group("ft_typescript", group_opts)
cmd("bufwritepre", { pattern = "*.ts,*.tsx", command = "EsLintFixAll", group = typescript })

-- Vim
local vim_options = group("vim_options", group_opts)
cmd("vimleave", { command = [[set guicursor=a:hor25]], group = vim_options })
cmd({"winleave", "insertenter"}, { command = [[set nocursorline]], group = vim_options })
cmd({"winenter", "insertleave"}, { command = [[set cursorline]], group = vim_options })
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
