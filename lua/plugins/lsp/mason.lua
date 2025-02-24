return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "taplo",
      "dockerls", "biome", "typescript-language-server", "json-lsp", "somesass_ls", "lua_language_server",
      "ruff", "ruff_lsp" }
  }
}
