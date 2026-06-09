local cmp = require "plugins.lsp.cmp"
local lazydev = require "plugins.lsp.lazydev"
local mason = require "plugins.lsp.mason"
local treesitter_context = require "plugins.lsp.nvim-treesitter-context"
local treesitter = require "plugins.lsp.nvim-treesitter"

return {
  treesitter,
  treesitter_context,
  mason,
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim",
      "neovim/nvim-lspconfig",
    },
    -- Installs the listed servers via Mason, then auto-enables them with
    -- vim.lsp.enable() (mason-lspconfig `automatic_enable` defaults to true).
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "rust_analyzer",
        "biome",
        "ts_ls",
        "terraformls",
        "gh_actions_ls",
        "prismals",
        "bashls",
        "stylelint_lsp",
        "vimls",
        "dockerls",
        "cssls",
        "somesass_ls",
        "taplo",
        "lua_ls",
        "jsonls",
      },
    },
  },
  cmp,
  lazydev,
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
}
