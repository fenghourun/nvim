local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  -- Everything in the snacks picker/explorer is kept transparent. NOTE: always
  -- pair `bg = "none"` with an explicit `fg`. A bg-only `{ bg = "none" }` is an
  -- *empty* highlight, which snacks clobbers with its own `default = true` link
  -- to NormalFloat (opaque) when the picker lazy-loads. Including fg keeps the
  -- group non-empty so the transparency survives regardless of load order.
  vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", fg = colors.text_primary })
  vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "none", fg = colors.text_primary })
  vim.api.nvim_set_hl(0, "SnacksList", { bg = "none", fg = colors.text_primary })
  vim.api.nvim_set_hl(0, "SnacksPickerTree", { fg = colors.line })
  vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = colors.red, bg = "none" })
  vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.background_dark, bg = "none" })

  -- Title toggle badges (the "h"/"i" hidden/ignored flags) are the only colored
  -- chips. Recent Neovim dropped the background on DiagnosticVirtualText*, which
  -- these link to by default, so set them explicitly. The base toggle group is
  -- kept transparent so only hidden/ignored render as chips.
  vim.api.nvim_set_hl(0, "SnacksPickerToggle", { bg = "none", fg = colors.text_primary })
  vim.api.nvim_set_hl(
    0,
    "SnacksPickerToggleHidden",
    { fg = colors.background_dark, bg = colors.cyan }
  )
  vim.api.nvim_set_hl(
    0,
    "SnacksPickerToggleIgnored",
    { fg = colors.background_dark, bg = colors.yellow }
  )
end
