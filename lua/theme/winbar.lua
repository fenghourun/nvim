local get_colors = require "theme.colors"

-- Filetypes/buftypes that should never show a winbar (dashboards, explorers, etc.)
local excluded_filetypes = {
  ["neo-tree"] = true,
  alpha = true,
  snacks_dashboard = true,
  help = true,
  qf = true,
  TelescopePrompt = true,
  ["which-key"] = true,
}

-- Whether the current window should display the file-path winbar
local function should_show_winbar()
  local win = vim.api.nvim_get_current_win()
  -- Skip floating windows
  if vim.api.nvim_win_get_config(win).relative ~= "" then
    return false
  end

  local buf = vim.api.nvim_win_get_buf(win)
  if vim.bo[buf].buftype ~= "" then
    return false
  end
  if excluded_filetypes[vim.bo[buf].filetype] then
    return false
  end
  -- Needs an actual file on disk
  return vim.api.nvim_buf_get_name(buf) ~= ""
end

-- Renders "  <icon> path/to/  filename ●" using statusline highlight syntax.
function _G.render_winbar()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)
  if filepath == "" then
    return ""
  end

  -- Full path with $HOME collapsed to ~
  local display = vim.fn.fnamemodify(filepath, ":~")
  local dir = vim.fn.fnamemodify(display, ":h")
  dir = (dir == "." or dir == "") and "" or (dir .. "/")
  local name = vim.fn.fnamemodify(display, ":t")

  -- File icon (colored) from mini.icons; degrade gracefully if unavailable
  local icon, icon_hl = "", "WinBarFileName"
  local ok, mini_icons = pcall(require, "mini.icons")
  if ok then
    local i, hl = mini_icons.get("file", name)
    if i and i ~= "" then
      icon, icon_hl = i, hl
    end
  end

  local modified = vim.bo[buf].modified and "  %#WinBarModified#●" or ""

  return table.concat {
    " ",
    "%#",
    icon_hl,
    "#",
    icon,
    " ",
    "%#WinBarPath#",
    dir,
    "%#WinBarFileName#",
    name,
    modified,
  }
end

local winbar_group = vim.api.nvim_create_augroup("CustomWinBar", { clear = true })

return function()
  local colors = get_colors()

  -- Transparent background so WezTerm's background shows through, matching the
  -- editor (Normal) and the tab bar (barbar_background = "none").
  vim.api.nvim_set_hl(0, "WinBar", { fg = colors.text_primary, bg = "none" })
  vim.api.nvim_set_hl(0, "WinBarNC", { fg = colors.grey, bg = "none" })
  vim.api.nvim_set_hl(0, "WinBarPath", { fg = colors.grey, bg = "none" })
  vim.api.nvim_set_hl(0, "WinBarFileName", { fg = colors.text_primary, bg = "none", bold = true })
  vim.api.nvim_set_hl(0, "WinBarModified", { fg = colors.orange, bg = "none" })

  -- Toggle the winbar per-window so special buffers stay bar-free.
  local function update_winbar()
    vim.wo.winbar = should_show_winbar() and "%{%v:lua.render_winbar()%}" or ""
  end

  vim.api.nvim_clear_autocmds { group = winbar_group }
  vim.api.nvim_create_autocmd(
    { "BufWinEnter", "WinEnter", "BufEnter", "FileType", "BufWritePost" },
    {
      group = winbar_group,
      callback = update_winbar,
    }
  )

  -- Apply immediately to the current window on (re)load.
  update_winbar()
end
