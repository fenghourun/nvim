local function setup_lsp()
  vim.lsp.enable {
    "pyright",
    "ruff",
    "rust_analyzer",
    "biome",
    "ts_ls",
  }
end

return setup_lsp
