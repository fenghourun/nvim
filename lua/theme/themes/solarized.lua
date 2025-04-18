local base_colors = {
  background1 = "#073642",
  background2 = "#021014",
  background3 = "#020c1a",
  background_dark = "#002831",
  black = "#002831",
  blue = "#2176c7",
  cyan = "#259286",
  green = "#45908f",
  purple = "#c678dd",
  red = "#AE1F1C",
  light_white = "#ffffff",
  white = "#eae3cb",
  grey = "#a1aab4",
  line = "#404f7d",
  dark_green = "#003748",
  orange = "#f34b00",
  dark_blue = "#178ec8",
  dark_purple = "#c678dd",
  yellow = "#b58900",
  pink = "#C678DD",
  lightbg = "#405570",
}

local M = {
  -- Base Colors
  background_dark = "#001418",
  background_light = "#002B36",
  background_lighter = "#073642",
  black = base_colors.black,
  blue = base_colors.blue,
  cyan = base_colors.cyan,
  green = base_colors.green,
  purple = base_colors.purple,
  red = base_colors.red,
  light_white = base_colors.light_white,
  white = base_colors.white,
  grey = base_colors.grey,
  line = base_colors.line,
  dark_green = base_colors.dark_green,
  orange = base_colors.orange,
  dark_blue = base_colors.dark_blue,
  dark_purple = base_colors.dark_purple,
  yellow = base_colors.yellow,
  pink = base_colors.pink,
  lightbg = base_colors.lightbg,
  pmenu_bg = base_colors.background2,

  -- Component specific colors
  pmenu_sel_bg = base_colors.red,
  statusline_bg = base_colors.background2,
  folder_bg = "#86a5ff",
  cursor_line_background = base_colors.dark_green,

  cmp_background = base_colors.background2,

  telescope_background = base_colors.background_dark,

  lualine_background = base_colors.background2,
  lualine_background2 = "#2a75a6",

  barbar_background = base_colors.background_dark,

  which_key_background = base_colors.background2,

  git_signs_add = "#487e02",
  git_signs_blame = "#35577d",

  diagnostics_error = "#f14c4c",

  -- Neo Tree
  neo_tree_background = base_colors.background_dark,
  neo_tree_modified = "#e2a974",
  neo_tree_root_background = "#1a304d",
  neo_tree_winbar_background = "#1a304d",

  winbar_background = base_colors.background1,
}

return M
