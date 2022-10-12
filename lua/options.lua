local opt = vim.opt
local fn = vim.fn

opt.autochdir = true
opt.autoread = true
opt.backup = true
opt.backupdir = fn.stdpath("data") .. "/backup"
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.colorcolumn = "+1"
opt.complete = opt.complete + "k"
opt.completeopt = { "noinsert", "menuone", "noselect" }
opt.cursorline = true
opt.dictionary = "/usr/share/dict/words"
opt.directory = fn.stdpath("data") .. "/swap"
opt.encoding = "utf-8"
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.fillchars = { vert = "┃" , diff = "•", fold = "-" }
opt.foldlevelstart = 0
opt.foldopen = opt.foldopen - "block"
opt.formatoptions = "tcqnj"
opt.gdefault = true
opt.hidden = true
opt.hlsearch = false
opt.ignorecase = true
opt.iskeyword = opt.iskeyword + "-"
opt.laststatus = 3
opt.lazyredraw = true
opt.matchpairs = opt.matchpairs + "<:>"
opt.matchtime = 3
opt.modelines = 0
opt.mouse = "a"
opt.number = true
opt.pumheight = 20
opt.scrolloff = 3
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = opt.shortmess + "cI"
opt.showbreak = "↪"
opt.showmatch = true
opt.showmode = false
opt.sidescrolloff = 4
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 2
opt.spell = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.synmaxcol = 200
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 100
opt.timeoutlen = 250
opt.title = true
opt.undodir = fn.stdpath("data") .. "/undo"
opt.undofile = true
opt.updatetime = 300
opt.visualbell = true
opt.wildignore = [[
  *.swp, *~, .tmp, __pycache__, .git, .hg, .svn, *.exe, *.bin, *.dll, *.o, *.out, *.so, *.elc,
  *.fasl, *.pyc, *.luac, *.jpg, *.jpeg, *.bmp, *.gif, *.png, *.tiff, *.tga, *.7z, *.bz2, *.dmg,
  *.gz, *.iso, *.jar, *.rar, *.tar, *.tar.*, *.tgz, *.txz, *.xz, *.zstd, *.zip, .DS_Store,
  Thumbs.db, *.sql, *.sqlite, *.db, *.obj, *.avi, *.mp4, *.mkv, *.ogv, *.oga, *.webm, *.mov, *.vob,
  *.mpg, *.mp3, *.ogg, *.wav, *.flac, *.otf, *.otc, *.ttf, *.ttc, *.woff, *.woff2, *.doc, *.pdf,
  .lock, *.lock, */tmp/*, **/mode_modules/**
  ]]
opt.wildmode = "list:full"
opt.wrap = false

vim.coolorscheme = "onedark"

vim.g.clipboard = {
  name = "xsel_override",
  copy = {
    ["+"] = { "xsel", "--input", "--clipboard" },
    ["*"] = { "xsel", "--input", "--primary" },
  },
  paste = {
    ["+"] = { "xsel", "--output", "--clipboard" },
    ["*"] = { "xsel", "--output", "--primary" },
  },
  cache_enabled = true,
}
