return {
  "stevearc/conform.nvim",
  lazy = false,
  cmd = "ConformInfo",
  opts = function()
    local opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }
    return opts
  end,
}
