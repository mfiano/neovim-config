require('gitsigns').setup {
  signs = {
    add = { hl = 'GitSignsAdd', text = '▍ ' },
    change = { hl = 'GitSignsChange', text = '▍ ' },
    delete = { hl = 'GitSignsDelete', text = '▍ ' },
  },
  numhl = false,
  linehl = false,
  keymaps = {
    noremap = false,
    buffer = false,
  },
  watch_gitdir = {
    interval = 1000
  },
  diff_opts = {
    internal = true
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
}
