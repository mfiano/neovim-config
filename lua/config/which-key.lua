local wk = require("which-key")
local visual_map = {
  ["<leader>"] = {
    b = {
      name = "buffer",
      p = { "y:let [f,s,v]=[&ft,&syn,getregtype('@\"')]<cr><c-w>nVp:set ft=<c-r>=f<cr> syn=<c-r>=s<cr><cr>:w! /tmp/paste<cr>:Bwipeout!<cr>:!paste.sh /tmp/paste<cr>", "paste" },
    },
  }
}
local normal_map = {
  ["<leader>"] = {
    ["<leader>"] = { ":Legendary keymaps<cr>", "legend" },
    ["'"] = { ":Telescope resume<cr>", "resume search"},
    [";"] = { ":Telescope command_history<cr>", "command history" },
    b = {
      name = "buffer",
      b = { ":Telescope buffers<cr>", "switch" },
      d = { ":Bwipeout<cr>", "delete" },
      p = { ":silent !paste.sh %<cr>", "paste" },
    },
    e = {
      name = "edit",
      l = { ":HopLine<cr>", "jump to line" },
      q = { ":copen<cr>", "open quickfix" },
      w = { ":HopWord<cr>", "jump to word" },
    },
    f = {
      name = "file",
      D = { ":Delete!<cr>", "delete file" },
      f = { ":Telescope find_files<cr>", "find file (hidden)" },
      F = { ":Telescope find_files hidden=true<cr>", "find file (hidden)" },
      h = { ":Telescope find_files cwd=~<cr>", "find in home" },
      H = { ":Telescope find_files cwd=~ hidden=true<cr>", "find in home (hidden)" },
      r = { ":Telescope oldfiles<cr>", "find recent" },
      R = { ":Rename ", "rename file" },
      s = { ":w!<cr>", "save" },
      S = { ":SudoWrite<cr>", "sudo save" },
    },
    g = {
      name = "git",
      b = { ":GitBlameToggle<cr>", "toggle blame" },
      c = { ":Telescope git_commits<cr>", "commits" },
      C = { ":Telescope git_bcommits<cr>", "buffer commits" },
      s = { ":FloatermNew --width=1.0 --title=git --position=center lazygit<cr>", "status" },
    },
    l = {
      name = "language",
      ea = { ":Lspsaga code_action<cr>", "code actions" },
      er = { ":Lspsaga rename<cr>", "rename" },
      oc = { ":AerialToggle<cr>", "code outline" },
      os = { ":SymbolsOutline<cr>", "symbol outline" },
      rr = { ":LspRestart<cr>", "restart LSP" },
      rs = { ":LspStart<cr>", "start LSP" },
      rS = { ":LspStop<cr>", "stop LSP" },
    },
    n = {
      name = "notes",
      n = { ":e ~/docuemnts/wiki/index.md<cr>", "open notes" },
    },
    p = {
      name = "project",
      f = { ":Telescope git_files<cr>", "find in project" },
      p = { ":Telescope repo list<cr>", "switch project" },
    },
    s = {
      name = "search",
      b = { ":Telescope current_buffer_fuzzy_find<cr>", "search buffer" },
      m = { ":Telescope marks<cr>", "marks" },
      p = { ":Telescope live_grep<cr>", "search project" },
      s = { ":Telescope spell_suggest<cr>", "spelling" },
    },
    t = {
      name = "toggle",
      h = { ":nohls<cr>", "search highlight" },
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
