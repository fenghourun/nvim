return {
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      --See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "luvit-meta/library", words = { "vim%.uv" } },
      "LazyVim",
      -- Only load the lazyvim library when the `LazyVim` global is found
      { path = "LazyVim", words = { "LazyVim" } },
    },
  },
  -- always enable unless `vim.g.lazydev_enabled = false`
  -- This is the default
  enabled = function()
    return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
  end,
}
