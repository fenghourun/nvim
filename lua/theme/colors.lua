return function()
  -- `chalk` (dark) is the only theme in use. Light-mode switching and the
  -- `quietLight` theme were removed; everything resolves to chalk.
  return require "theme.themes.chalk"
end
