local wk = require("which-key")
local visual_map = {}
local normal_map = {
  ["<leader>"] = {
    ["<leader>"] = { ":Legendary keymaps<cr>", "legend" },
    ["'"] = { ":Telescope resume<cr>", "resume search"},
    [";"] = { ":Telescope command_history<cr>", "command history" },
    b = {
      name = "buffer",
      b = { ":Telescope buffers ignore_current_buffer=true sort_mru=true<cr>", "switch" },
      d = { ":Bwipeout<cr>", "delete" },
      p = { ":silent !paste.sh %<cr>", "paste" },
      s = { ":Telescope live_grep grep_open_files=true<cr>", "search open buffers" },
      S = { ":Telescope current_buffer_fuzzy_find<cr>", "search buffer" },
    },
    f = {
      name = "file",
      D = { ":Remove! | :Bwipeout!<cr>", "delete file" },
      f = { ":Telescope find_files<cr>", "find file (hidden)" },
      F = { ":Telescope find_files hidden=true<cr>", "find file (hidden)" },
      h = { ":Telescope find_files cwd=~<cr>", "find in home" },
      H = { ":Telescope find_files cwd=~ hidden=true<cr>", "find in home (hidden)" },
      on = { ":e ~/documents/wiki/index.md<cr>", "open notes" },
      ov = { ":e $MYVIMRC<cr>", "open vim config" },
      r = { ":Telescope oldfiles<cr>", "find recent" },
      R = { ":Rename ", "rename file" },
      s = { ":w!<cr>", "save" },
      S = { ":SudoWrite<cr>", "sudo save" },
    },
    g = {
      name = "git",
      b = { ":GitBlameToggle<cr>", "toggle blame" },
      s = { ":FloatermNew --width=1.0 --title=git --position=center lazygit<cr>", "status" },
    },
    j = {
      name = "jump",
      l = { ":HopLine<cr>", "jump to line" },
      w = { ":HopWord<cr>", "jump to word" },
    },
    l = {
      name = "lsp",
      d = { ":TroubleToggle<cr>", "toggle diagnostics panel" },
      o = { ":AerialToggle<cr>", "code outline" },
      r = { ":LspRestart<cr>", "restart LSP" },
      s = { ":LspStart<cr>", "start LSP" },
      S = { ":LspStop<cr>", "stop LSP" },
    },
    p = {
      name = "project",
      f = { ":Telescope git_files show_untracked=true<cr>", "find in project" },
      p = { ":Telescope repo list<cr>", "switch project" },
      s = { ":Telescope live_grep<cr>", "search project" },
    },
    t = {
      name = "toggle",
      i = { ":IndentBlanklineToggle<cr>", "indent guides" },
      n = { ":setl number!<cr>", "line numbers" },
    },
    v = {
      name = "vim",
      p = { ":PackerProfile<cr>", "package profile" },
      s = { ":PackerSync<cr>", "package sync" },
    },
    w = {
      name = "window",
      ["-"] = { ":split<cr>", "split horizontal" },
      ["|"] = { ":vsplit<cr>", "split vertical" },
      d = { ":close<cr>", "delete" },
    },
  }
}
wk.register(normal_map, {})
wk.register(visual_map, { mode = "v" })
