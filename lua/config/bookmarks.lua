require("bookmarks").setup({
  keymap = {
    toggle = "\\bb",
    add = "\\ba",
    jump = "<cr>",
    delete = "dd",
    delete_on_virt = "\\bd",
    order = "<space><space>",
  },
  preview_ratio = 0.4,
  preview_ext_enable = true,
  virt_text = ""
})
