return {
  "stevearc/conform.nvim",
  lazy = false,
  cmd = "ConformInfo",
  opts = function()
    ---@class ConformOpts
    local opts = {
      ---@type table<string, conform.FormatterUnit[]>
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
