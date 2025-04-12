local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  -- Offset
  vim.api.nvim_set_hl(0, "BufferOffset", {
    fg = colors.light_white,
    bg = colors.barbar_background,
  })
  --  Current
  vim.api.nvim_set_hl(
    0,
    "BufferCurrent",
    { fg = colors.text_hightlight, bg = colors.barbar_background_current }
  )

  -- requires config.icons.filetype.custom_color = true
  vim.api.nvim_set_hl(0, "BufferCurrentIcon", { bg = colors.barbar_background_current })

  vim.api.nvim_set_hl(0, "BufferCurrentIndex", {
    fg = colors.text_hightlight,
    bg = colors.barbar_current_index,
  })

  vim.api.nvim_set_hl(0, "BufferCurrentSign", {
    fg = colors.green,
    bg = colors.barbar_background_current,
  })

  vim.api.nvim_set_hl(0, "BufferCurrentSignRight", {
    fg = colors.barbar_background_current,
    bg = colors.barbar_background_current,
  })

  vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = colors.barbar_background_current })

  vim.api.nvim_set_hl(0, "BufferCurrentTarget", {
    fg = colors.text_highlight,
    bg = colors.barbar_background_current,
  })
  -- Visible
  vim.api.nvim_set_hl(
    0,
    "BufferVisible",
    { fg = colors.text_primary, bg = colors.background_light }
  )
  vim.api.nvim_set_hl(0, "BufferVisibleIcon", { bg = colors.background_light }) -- requires custom_color = true
  vim.api.nvim_set_hl(
    0,
    "BufferVisibleIndex",
    { fg = colors.text_primary, bg = colors.barbar_inactive_index }
  )
  vim.api.nvim_set_hl(
    0,
    "BufferVisibleSign",
    { fg = colors.background, bg = colors.background_light }
  )
  vim.api.nvim_set_hl(
    0,
    "BufferVisibleSignRight",
    { fg = colors.background, bg = colors.background_light }
  )
  vim.api.nvim_set_hl(
    0,
    "BufferVisibleMod",
    { fg = colors.text_highlight, bg = colors.background_light }
  )
  vim.api.nvim_set_hl(
    0,
    "BufferVisibleTarget",
    { fg = colors.text_primary, bg = colors.background_light }
  )
  -- Inactive
  vim.api.nvim_set_hl(0, "BufferInactive", {
    fg = colors.grey,
    bg = colors.barbar_background_inactive,
  })

  vim.api.nvim_set_hl(0, "BufferInactiveIcon", {
    bg = colors.barbar_background_inactive,
  }) -- requires custom_color = true

  vim.api.nvim_set_hl(0, "BufferInactiveIndex", {
    fg = colors.text_primary,
    bg = colors.barbar_inactive_index,
  })

  vim.api.nvim_set_hl(0, "BufferInactiveSign", {
    fg = colors.barbar_background_inactive,
    bg = colors.barbar_background_inactive,
  })

  vim.api.nvim_set_hl(0, "BufferInactiveSignRight", {
    fg = colors.barbar_background_inactive,
    bg = colors.barbar_background_inactive,
  })

  vim.api.nvim_set_hl(0, "BufferInactiveMod", {
    fg = colors.text_highlight,
    bg = colors.barbar_background_inactive,
  })

  vim.api.nvim_set_hl(0, "BufferInactiveTarget", {
    fg = colors.text_primary,
    bg = colors.barbar_background_inactive,
  })
  -- Fill
  vim.api.nvim_set_hl(0, "BufferTabpage", {
    bg = colors.barbar_background,
    fg = colors.barbar_background,
  })

  vim.api.nvim_set_hl(0, "BufferTabpageFill", {
    bg = colors.barbar_background,
    fg = colors.barbar_background,
  })

  vim.api.nvim_set_hl(0, "BufferTabpages", {
    bg = colors.barbar_background,
    fg = colors.barbar_background,
  })

  vim.api.nvim_set_hl(0, "BufferTabpagesSep", {
    bg = colors.barbar_background,
    fg = colors.barbar_background,
  })
end
