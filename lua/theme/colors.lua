return function()
  if vim.o.background == "light" then
    local colors = require "theme.themes.quietLight"
    return colors
  else
    local colors = require "theme.themes.gruvbox"
    return colors
  end
end
