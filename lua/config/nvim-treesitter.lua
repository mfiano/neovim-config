require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "html",
    "json",
    "julia",
    "latex",
    "lua",
    "markdown",
    "toml",
    "yaml"
  },
  highlight = {
    enable = true
  },
  autopairs = { enable = true },
}
