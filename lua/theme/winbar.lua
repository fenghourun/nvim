local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  vim.api.nvim_set_hl(0, "WinBar", { fg = colors.winbar_background })
  vim.api.nvim_set_hl(0, "WinBarNC", { bg = colors.winbar_background })
  vim.api.nvim_set_hl(0, "WinBarPath", { fg = colors.text_primary, bg = colors.winbar_background })
  vim.api.nvim_set_hl(
    0,
    "WinBarFileName",
    { fg = colors.text_primary, bg = colors.winbar_background }
  )
end
