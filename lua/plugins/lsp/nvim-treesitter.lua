return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"
    local opts = {
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "latex" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "lua",
        "luadoc",
        "python",
        "typescript",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "rust",
        "gitcommit",
        "gitignore",
        "git_rebase",
        "git_config",
        "tsx",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "regex",
      },
      auto_install = true,
      sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      playground = {
        enable = true,
      },
    }
    configs.setup(opts)
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
