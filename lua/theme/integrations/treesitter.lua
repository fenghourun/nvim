local get_colors = require "theme.colors"
return function()
  local colors = get_colors()
  -- " TREESITTER
  vim.api.nvim_set_hl(0, "@comment", { fg = colors.comment })
  vim.api.nvim_set_hl(0, "@string", { fg = colors.string })
  vim.api.nvim_set_hl(0, "@constant", { fg = colors.constant })
  vim.api.nvim_set_hl(0, "@KeywordFunction", { fg = colors.purple })
  vim.api.nvim_set_hl(0, "@function", { fg = colors.func, bold = true })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.func, bold = true })
  vim.api.nvim_set_hl(0, "@function.call", { fg = colors.func })
  vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.blue })

  vim.api.nvim_set_hl(0, "@conditional", { fg = colors.purple })
  vim.api.nvim_set_hl(0, "@keyword", { fg = colors.keyword })
  vim.api.nvim_set_hl(0, "@keyword.modifier.typescript", { fg = colors.type })
  vim.api.nvim_set_hl(0, "@keyword.import.typescript", { fg = colors.keyword_import_typescript })
  vim.api.nvim_set_hl(
    0,
    "@keyword.coroutine.typescript",
    { fg = colors.keyword_coroutine_typescript }
  )

  vim.api.nvim_set_hl(0, "@field", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "@variable", { fg = colors.variable })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.variable_builtin })
  vim.api.nvim_set_hl(0, "@variable.member", { fg = colors.variable_member })
  vim.api.nvim_set_hl(0, "@operator", { fg = colors.operator })

  vim.api.nvim_set_hl(0, "@property", { fg = colors.property })
  vim.api.nvim_set_hl(0, "@parameter", { fg = colors.red })

  vim.api.nvim_set_hl(0, "@method", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "@include", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "@type", { fg = colors.type, bold = true })
  vim.api.nvim_set_hl(0, "@type.qualifier", { fg = colors.purple })

  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.bracket })

  vim.api.nvim_set_hl(0, "@constructor", { fg = colors.red })
  vim.api.nvim_set_hl(0, "@label", { fg = colors.red })

  -- Context
  vim.api.nvim_set_hl(0, "TreeSitterContext", { fg = colors.background })
  vim.api.nvim_set_hl(0, "TreeSitterContextBottom", { bg = colors.background })
end
