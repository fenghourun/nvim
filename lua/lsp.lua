local function setup_lsp()
  vim.lsp.enable {
    "pyright",
    "ruff",
    "rust_analyzer",
    "biome",
    "ts_ls",
    "terraformls",
    "gh_actions_language_server",
    "lean_language_server",
    "prismals",
    "actionlint",
    "bashls",
    "stylelint",
  }
end

return setup_lsp
