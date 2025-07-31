return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    -- you also will likely want nvim-cmp or some completion engine
  },

  ---@module 'lean'
  ---@type lean.Config
  opts = {
    lsp = {},
    infoview = {
      goal_markers = {
        accomplished = "",
      },
    },
    mappings = true,
  },
}
