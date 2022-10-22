local util = require("lib/util")

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require("packer")

packer.init({
  autoremove = true,
  enable = true,
  threshold = 0,
  max_jobs = 24,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = { enable = true, threshold = 0 }
})

packer.startup(function(use)
  -- aerial
  use {
    "stevearc/aerial.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function() require("aerial").setup() end,
    cmd = "AerialToggle"
  }
  -- barbecue
  use {
    "utilyre/barbecue.nvim",
    requires = {
      "SmiteshP/nvim-navic",
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require("barbecue").setup({}) end
  }
  -- bash-language-server
  use "bash-lsp/bash-language-server"
  -- bookmarks
  use {
    "crusj/bookmarks.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = util.get_config("bookmarks")
  }
  -- bufdelete
  use { "famiu/bufdelete.nvim", cmd = { "Bwipeout", "Bwipeout!" } }
  -- Comment
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  -- feline
  use {
    "feline-nvim/feline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    config = util.get_config("feline")
  }
  -- git-blame
  use { "f-person/git-blame.nvim", config = util.get_config("git-blame"), cmd = "GitBlameToggle" }
  -- gitsigns
  use { "lewis6991/gitsigns.nvim", config = util.get_config("gitsigns") }
  -- goto-preview
  use {
    "rmagatti/goto-preview",
    requires = "nvim-telescope/telescope.nvim",
    config = util.get_config("goto-preview")
  }
  -- highlight-current-n
  use { "rktjmp/highlight-current-n.nvim", config = util.get_config("highlight-current-n") }
  -- hlargs
  use {
    "m-demare/hlargs.nvim",
    config = function() require("hlargs").setup() end,
    requires = { "nvim-treesitter/nvim-treesitter" }
  }
  -- hop
  use {
    "phaazon/hop.nvim",
    config = function() require("hop").setup() end,
    cmd = { "HopLine", "HopWord" }
  }
  -- indent-blankline
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = util.get_config("indent-blankline"),
    event = "bufreadpre"
  }
  -- legendary
  use {
    "mrjones2014/legendary.nvim",
    requires = "stevearc/dressing.nvim",
    config = function() require("legendary").setup() end,
    cmd = "Legendary"
  }
  -- lsp-overloads
  use "Issafalcon/lsp-overloads.nvim"
  -- lspkind
  use {"onsails/lspkind.nvim", config = util.get_config("lspkind") }
  -- mkdir
  use "jghauser/mkdir.nvim"
  -- mkdnflow
  use { "jakewvincent/mkdnflow.nvim", config = util.get_config("mkdnflow"), ft = "markdown.pandoc" }
  -- nvim-autopairs
  use { "windwp/nvim-autopairs", config = util.get_config("nvim-autopairs") }
  -- nvim-bqf
  use {
    "kevinhwang91/nvim-bqf",
    requires = {
      "junegunn/fzf",
      "nvim-treesitter/nvim-treesitter"
    }
  }
  -- nvim-cmp
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-path",
      "kdheepak/cmp-latex-symbols",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua"
    },
    config = util.get_config("nvim-cmp")
  }
  -- nvim-lastplace
  use { "ethanholz/nvim-lastplace", config = function() require("nvim-lastplace").setup() end }
  -- nvim-lspconfig
  use { "neovim/nvim-lspconfig", config = util.get_config("nvim-lspconfig") }
  -- nvim-navic
  use "SmiteshP/nvim-navic"
  -- nvim-surround
  use { "kylechui/nvim-surround", config = function() require("nvim-surround").setup() end }
  -- nvim-telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-project.nvim",
      "cljoly/telescope-repo.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    },
    config = util.get_config("telescope")
  }
  -- nvim-treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = util.get_config("nvim-treesitter"),
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end
  }
  -- nvim-web-devicons
  use "kyazdani42/nvim-web-devicons"
  -- null-ls
  use { "jose-elias-alvarez/null-ls.nvim", config = util.get_config("null-ls") }
  -- onedark
  use { "navarasu/onedark.nvim", config = util.get_config("onedark") }
  -- packer
  use "wbthomason/packer.nvim"
  -- project
  use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup() end }
  -- quick-scope
  use { "unblevable/quick-scope", config = util.get_config("quick-scope") }
  -- rust-tools
  use {
    "simrat39/rust-tools.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = util.get_config("rust-tools")
  }
  -- tidy
  use { "mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end }
  -- todo-comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = util.get_config("todo-comments")
  }
  -- trouble
  use { "folke/trouble.nvim", config = util.get_config("trouble") }
  -- vim-devicons
  use "ryanoasis/vim-devicons"
  -- vim-illuminate
  use { "RRethy/vim-illuminate", config = function() require("illuminate").configure() end }
  -- virtcolumn
  use "xiyaowong/virtcolumn.nvim"
  -- which-key
  use { "folke/which-key.nvim", config = util.get_config("which-key") }
  -- yanky
  use { "gbprod/yanky.nvim", config = util.get_config("yanky") }

  -- TODO: Replace with Lua alternatives
  use "puremourning/vimspector"
  use "ron-rs/ron.vim"
  use "wellle/targets.vim"
  use "tpope/vim-repeat"
  use "chaoren/vim-wordmotion"
  use "maralla/vim-toml-enhance"
  use "elzr/vim-json"
  use "alvan/vim-closetag"
  use "tpope/vim-eunuch"
  use "neomutt/neomutt.vim"
  use { "voldikss/vim-floaterm", config = util.get_config("floaterm"), cmd = "FloatermNew" }

  -- TODO: Try these out
  -- use "frabjous/knap"

  if packer_bootstrap then
    packer.sync()
  end

end)
