return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "lua_ls",
      "rust_analyzer",
      "taplo",
      "terraform-ls",
      "dockerls",
      "biome",
      "typescript-language-server",
      "json-lsp",
      "some-sass-language-server",
      "ruff",
      "actionlint",
      "bash-language-server",
      "dotenv-linter",
    },
  },
}
