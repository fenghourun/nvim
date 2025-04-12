local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = colors.red, bg = colors.noice_background })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = colors.noice_background })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.noice_background })
  vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { bg = colors.red })
  vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = colors.red })
  vim.api.nvim_set_hl(0, "NoicePopup", { bg = colors.noice_background })
end
