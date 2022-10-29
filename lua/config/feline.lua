local line_ok, feline = pcall(require, "feline")
if not line_ok then
  return
end

local one_monokai = {
  fg = "#abb2bf",
  bg = "#353b45",
  green = "#98c379",
  yellow = "#e5c07b",
  purple = "#c678dd",
  orange = "#d19a66",
  peanut = "#f6d5a4",
  red = "#e06c75",
  aqua = "#61afef",
}

local vi_mode_colors = {
  NORMAL = "green",
  OP = "green",
  INSERT = "yellow",
  VISUAL = "purple",
  LINES = "orange",
  BLOCK = "dark_red",
  REPLACE = "red",
  COMMAND = "aqua",
}

local c = {
  vim_mode = {
    provider = { name = "vi_mode", opts = { show_mode_name = true, }, },
    icon = '',
    hl = function()
      return {
        fg = require("feline.providers.vi_mode").get_mode_color(),
        style = "bold",
        name = "NeovimModeHLColor",
      }
    end,
    left_sep = "block",
    right_sep = "block",
  },
  fileinfo = {
    provider = { name = "file_info", opts = { type = "short" }, },
    hl = { style = "bold" },
    left_sep = "block",
    right_sep = "block",
  },
  file_size = {
    provider = 'file_size',
    left_sep = "block",
    right_sep = "block",
  },
  position = {
    provider = "position",
    left_sep = "block",
    right_sep = "block",
  },
  diagnostic_errors = {
    provider = "diagnostic_errors",
    hl = { fg = "red", },
  },
  diagnostic_warnings = {
    provider = "diagnostic_warnings",
    hl = { fg = "yellow", },
  },
  diagnostic_info = {
    provider = "diagnostic_info",
  },
  diagnostic_hints = {
    provider = "diagnostic_hints",
    hl = { fg = "aqua", },
  },
  gitDiffAdded = {
    provider = "git_diff_added",
    hl = { fg = "green", },
    left_sep = "block",
  },
  gitDiffRemoved = {
    provider = "git_diff_removed",
    hl = { fg = "red", },
  },
  gitDiffChanged = {
    provider = "git_diff_changed",
    right_sep = "block",
  },
  gitBranch = {
    provider = "git_branch",
    hl = { fg = "peanut", style = "bold", },
    left_sep = "block",
    right_sep = "block",
  },
  line_percentage = {
    provider = "line_percentage",
    hl = { fg = "aqua", style = "bold", },
    left_sep = "block",
    right_sep = "block",
  },
}

local left = {
  c.vim_mode,
  c.fileinfo,
  c.file_size,
  c.position,
  c.diagnostic_errors,
  c.diagnostic_warnings,
  c.diagnostic_info,
  c.diagnostic_hints,
}

local right = {
  c.gitDiffAdded,
  c.gitDiffRemoved,
  c.gitDiffChanged,
  c.gitBranch,
  c.line_percentage,
}

local components = {
  active = { left, right, },
  inactive = { left, right, },
}

feline.setup({
  default_fg = '#abb2bf',
  default_bg = '#282c34',
  components = components,
  theme = one_monokai,
  vi_mode_colors = vi_mode_colors,
})
require('feline').winbar.setup()
