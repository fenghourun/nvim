local get_colors = require "theme.colors"

local set_copilot = function()
  local colors = get_colors()
  vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = colors.copilot_completion, italic = true })
end

return set_copilot
