local get_colors = require "theme.colors"

return function()
  local colors = get_colors()
  -- Menu
  vim.api.nvim_set_hl(0, "CmpPmenu", { bg = colors.pmenu_bg })
  vim.api.nvim_set_hl(0, "CmpBorder", { fg = colors.red })

  vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = colors.red, bg = colors.background3 })
  vim.api.nvim_set_hl(0, "CmpDocPMenu", { fg = colors.text_primary, bg = colors.background3 })
  vim.api.nvim_set_hl(0, "CmpPmenuBorder", { bg = colors.yellow })

  -- Defaults
  vim.api.nvim_set_hl(0, "CmpItemKindDefault", { fg = colors.text_primary })
  vim.api.nvim_set_hl(0, "CmpItemMenuDefault", { fg = colors.text_primary })
  vim.api.nvim_set_hl(0, "CmpItemAbbrDefault", { fg = colors.cmp_text })

  -- Kinds
  vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.pink })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.green })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.pink })
  vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.orange })

  -- Matches
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.green })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.green })
end
