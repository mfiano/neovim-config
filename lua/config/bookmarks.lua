require("bookmarks").setup({
  keymap = {
    toggle = "\\bb",
    add = "\\ba",
    jump = "<cr>",
    delete = "dd",
    order = "<space><space>",
  },
  preview_ratio = 0.4,
  preview_ext_enable = true,
})
