local map = vim.keymap.set
local nvim_lsp = require("lspconfig")

local servers = { "bashls", "glslls", "texlab" }

local flags = {
  debounce_text_changes = 150
}

local function on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  if client.server_capabilities.signatureHelpProvider then
    require("lsp-overloads").setup(client, {})
  end
  local opts = { silent = true, buffer = true }
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gd", function() require("goto-preview").goto_preview_definition({}) end, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gr", function() require("goto-preview").goto_preview_references() end, opts)
  map("n", "gt", vim.lsp.buf.type_definition, opts)
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = flags
  }
end

vim.diagnostic.config({
  virtual_text = true
})

-- Julia
nvim_lsp.julials.setup({
  on_attach = on_attach,
  on_new_config = function(new_config, _)
    local julia = vim.fn.expand("~/.data/julia/environments/nvim-lspconfig/bin/julia")
    if nvim_lsp.util.path.is_file(julia) then
      new_config.cmd[1] = julia
    end
  end
})

-- Lua
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }
    }
  }
}

-- Rust
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self"
      },
      cargo = {
        buildScripts = {
          enable = true
        }
      },
      procMacro = {
        enable = true
      },
      checkOnSave = {
        command = "clippy",
        extraArgs = {
          "--",
          "-Aclippy::cast_possible_truncation",
          "-Aclippy::cast_possible_wrap",
          "-Aclippy::cast_precision_loss",
          "-Aclippy::doc_markdown",
          "-Aclippy::implicit_hasher",
          "-Aclippy::maybe_infinite_iter",
          "-Dclippy::cargo",
          "-Dclippy::fn_to_numeric_cast_any",
          "-Dclippy::mem_forget",
          "-Dclippy::same_name_method",
          "-Wabsolute_paths_not_starting_with_crate",
          "-Welided_lifetimes_in_paths",
          "-Wexplicit_outlives_requirements",
          "-Wkeyword_idents",
          "-Wmacro_use_extern_crate",
          "-Wmeta_variable_misuse",
          "-Wmissing_abi",
          "-Wmissing_copy_implementations",
          "-Wmissing_debug_implementations",
          "-Wnoop_method_call",
          "-Wrust_2021_incompatible_closure_captures",
          "-Wrust_2021_incompatible_or_patterns",
          "-Wrust_2021_prefixes_incompatible_syntax",
          "-Wrust_2021_prelude_collisions",
          "-Wsingle_use_lifetimes",
          "-Wtrivial_casts",
          "-Wtrivial_numeric_casts",
          "-Wunreachable_pub",
          "-Wunsafe_code",
          "-Wunused_crate_dependencies",
          "-Wunused_import_braces",
          "-Wunused_lifetimes",
          "-Wunused_macro_rules",
          "-Wunused_qualifications",
          "-Wunused_results",
          "-Wunused_tuple_struct_fields",
          "-Wvariant_size_differences",
          "-Wclippy::pedantic",
          "-Wclippy::alloc_instead_of_core",
          "-Wclippy::allow_attributes_without_reason",
          "-Wclippy::branches_sharing_code",
          "-Wclippy::cognitive_complexity",
          "-Wclippy::debug_assert_with_mut_call",
          "-Wclippy::empty_drop",
          "-Wclippy::empty_structs_with_brackets",
          "-Wclippy::equatable_if_let",
          "-Wclippy::fallible_impl_from",
          "-Wclippy::float_cmp_const",
          "-Wclippy::format_push_string",
          "-Wclippy::future_not_send",
          "-Wclippy::if_then_some_else_none",
          "-Wclippy::imprecise_flops",
          "-Wclippy::iter_with_drain",
          "-Wclippy::large_include_file",
          "-Wclippy::lossy_float_literal",
          "-Wclippy::missing_const_for_fn",
          "-Wclippy::multiple_crate_versions",
          "-Wclippy::mutex_atomic",
          "-Wclippy::mutex_integer",
          "-Wclippy::non_send_fields_in_send_ty",
          "-Wclippy::nonstandard_macro_braces",
          "-Wclippy::option_if_let_else",
          "-Wclippy::path_buf_push_overwrite",
          "-Wclippy::redundant_pub_crate",
          "-Wclippy::str_to_string",
          "-Wclippy::string_lit_as_bytes",
          "-Wclippy::string_to_string",
          "-Wclippy::suboptimal_flops",
          "-Wclippy::todo",
          "-Wclippy::trailing_empty_array",
          "-Wclippy::trait_duplication_in_bounds",
          "-Wclippy::trivial_regex",
          "-Wclippy::try_err",
          "-Wclippy::type_repetition_in_bounds",
          "-Wclippy::unimplemented",
          "-Wclippy::unreachable",
          "-Wclippy::unseparated_literal_suffix",
          "-Wclippy::unused_rounding",
          "-Wclippy::use_self",
          "-Wclippy::useless_let_if_seq"
        }
      }
    }
  }
}
