local function setup_lsp()
  vim.lsp.enable {
    "pyright",
    "ruff",
    "rust_analyzer",
    "biome",
    "ts_ls",
    "terraformls",
    "gh_actions_language_server",
    "actionlint",
  }
end

return setup_lsp
