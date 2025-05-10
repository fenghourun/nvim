return function()
  if vim.o.background == "light" then
    local colors = require "theme.themes.quietLight"
    return colors
  else
    local colors = require "theme.themes.green"
    return colors
  end
end
