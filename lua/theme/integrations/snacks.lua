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
end
