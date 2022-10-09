require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "css",
    "comment",
    "commonlisp",
    "gitignore",
    "glsl",
    "help",
    "html",
    "javascript",
    "json",
    "julia",
    "latex",
    "lua",
    "make",
    "markdown",
    "regex",
    "scheme",
    "typescript",
    "toml",
    "yaml"
  },
  highlight = {
    enable = true
  },
  autopairs = { enable = true },
}
