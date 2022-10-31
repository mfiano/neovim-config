require("nvim-treesitter.configs").setup {
  auto_install = true,
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
    "rust",
    "scheme",
    "typescript",
    "toml",
    "yaml"
  },
  highlight = {
    enable = true,
    disable = {
      "julia"
    },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  autopairs = { enable = true }
}
