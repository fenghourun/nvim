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

  -- Context (sticky outer-scope banner at the top of the window).
  -- NOTE: the plugin's groups are spelled "Treesitter..." (lowercase 's') --
  -- the old "TreeSitterContext" names were silently ignored, leaving the
  -- banner indistinguishable from the code below it.
  -- Sticky outer-scope banner (treesitter-context). The editor background is
  -- transparent, but an underline separator picks up the syntax colours of the
  -- code above it and looks inconsistent. Instead use a subtle solid fill
  -- (context_background -- a touch lighter than the base background, tinted
  -- toward the theme's greens) to set the banner apart. This is a deliberate,
  -- minimal exception to the otherwise transparent UI; see README "Transparency".
  vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.context_background })
  vim.api.nvim_set_hl(
    0,
    "TreesitterContextLineNumber",
    { fg = colors.grey, bg = colors.context_background }
  )
  vim.api.nvim_set_hl(0, "TreesitterContextBottom", { bg = colors.context_background })
end
