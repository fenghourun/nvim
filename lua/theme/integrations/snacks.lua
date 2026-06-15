local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none" })
  vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "none", fg = colors.lualine_background })
  vim.api.nvim_set_hl(0, "SnacksList", { bg = colors.cyan })
  vim.api.nvim_set_hl(0, "SnacksPickerTree", { fg = colors.line })
  vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = colors.red, bg = colors.background_dark })
  vim.api.nvim_set_hl(
    0,
    "SnacksPickerBorder",
    { fg = colors.background_dark, background = colors.background_dark }
  )
  -- Title toggle badges (e.g. the "h"/"i" hidden/ignored flags). Recent Neovim
  -- dropped the background on DiagnosticVirtualText*, which these link to by
  -- default, leaving the badges with no background. Give them chip styling.
  vim.api.nvim_set_hl(0, "SnacksPickerToggle", { fg = colors.background_dark, bg = colors.grey })
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
