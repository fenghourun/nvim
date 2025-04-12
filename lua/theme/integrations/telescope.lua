local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = colors.white, bg = colors.telescope_background })
  vim.api.nvim_set_hl(
    0,
    "TelescopeBorder",
    { fg = colors.telescope_background, bg = colors.telescope_background }
  )
  vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.red })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = colors.white, bg = colors.selection })

  vim.api.nvim_set_hl(
    0,
    "TelescopePromptNormal",
    { fg = colors.white, bg = colors.telescope_background }
  )
  vim.api.nvim_set_hl(
    0,
    "TelescopePromptBorder",
    { fg = colors.telescope_background, bg = colors.telescope_background }
  )
  vim.api.nvim_set_hl(
    0,
    "TelescopePromptPrefix",
    { fg = colors.white, bg = colors.telescope_background }
  )
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.background2, bg = colors.green })
  vim.api.nvim_set_hl(
    0,
    "TelescopePromptCounter",
    { fg = colors.grey, bg = colors.telescope_background }
  )

  vim.api.nvim_set_hl(
    0,
    "TelescopePreviewNormal",
    { fg = colors.white, bg = colors.telescope_background }
  )
  vim.api.nvim_set_hl(
    0,
    "TelescopePreviewBorder",
    { fg = colors.telescope_background, bg = colors.telescope_background }
  )
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.background, bg = colors.green })
end
