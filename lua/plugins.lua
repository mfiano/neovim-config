local util = require("util")

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
  use "wbthomason/packer.nvim"
  use { "neovim/nvim-lspconfig", config = util.get_config("nvim-lspconfig") }
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
  use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup() end }
  use { "mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end }
  use {
    "feline-nvim/feline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    config = util.get_config("feline")
  }
  use { "famiu/bufdelete.nvim", cmd = { "Bwipeout", "Bwipeout!" } }
  use {
    "nvim-treesitter/nvim-treesitter",
    config = util.get_config("nvim-treesitter"),
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end
  }
  use "ryanoasis/vim-devicons"
  use "kyazdani42/nvim-web-devicons"
  use { "navarasu/onedark.nvim", config = util.get_config("onedark") }
  use { "lewis6991/gitsigns.nvim", config = util.get_config("gitsigns") }
  use { "f-person/git-blame.nvim", config = util.get_config("git-blame"), cmd = "GitBlameToggle" }
  use { "unblevable/quick-scope", config = util.get_config("quick-scope") }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = util.get_config("indent-blankline"),
    event = "bufreadpre"
  }
  use { "kylechui/nvim-surround", config = function() require("nvim-surround").setup() end }
  use { "folke/which-key.nvim", config = util.get_config("which-key") }
  use "bash-lsp/bash-language-server"
  use {
    "phaazon/hop.nvim",
    config = function() require("hop").setup() end,
    cmd = { "HopLine", "HopWord" }
  }
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
  use {"onsails/lspkind.nvim", config = util.get_config("lspkind") }
  use {
    "rmagatti/goto-preview",
    requires = "nvim-telescope/telescope.nvim",
    config = util.get_config("goto-preview")
  }
  use {
    "stevearc/aerial.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function() require("aerial").setup() end,
    cmd = "AerialToggle"
  }
  use {
    "mrjones2014/legendary.nvim",
    requires = "stevearc/dressing.nvim",
    config = function() require("legendary").setup() end,
    cmd = "Legendary"
  }
  use { "rktjmp/highlight-current-n.nvim", config = util.get_config("highlight-current-n") }
  use {
    "kevinhwang91/nvim-bqf",
    requires = {
      "junegunn/fzf",
      "nvim-treesitter/nvim-treesitter"
    }
  }
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = util.get_config("todo-comments")
  }
  use { "gbprod/yanky.nvim", config = util.get_config("yanky") }
  use "xiyaowong/virtcolumn.nvim"
  use {
    "crusj/bookmarks.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = util.get_config("bookmarks")
  }
  use "jghauser/mkdir.nvim"
  use { "jakewvincent/mkdnflow.nvim", config = util.get_config("mkdnflow"), ft = "markdown.pandoc" }
  use "SmiteshP/nvim-navic"
  use {
    "utilyre/barbecue.nvim",
    requires = {
      "SmiteshP/nvim-navic",
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require("barbecue").setup({}) end
  }
  use {
    "simrat39/rust-tools.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = util.get_config("rust-tools")
  }
  use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }
  use { "ethanholz/nvim-lastplace", config = function() require("nvim-lastplace").setup() end }
  use "Issafalcon/lsp-overloads.nvim"
  use { "folke/trouble.nvim", config = util.get_config("trouble") }
  use { "jose-elias-alvarez/null-ls.nvim", config = util.get_config("null-ls") }
  use { "windwp/nvim-autopairs", config = util.get_config("nvim-autopairs") }
  use { "RRethy/vim-illuminate", config = function() require("illuminate").configure() end }
  use {
    "m-demare/hlargs.nvim",
    config = function() require("hlargs").setup() end,
    requires = { "nvim-treesitter/nvim-treesitter" }
  }

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
