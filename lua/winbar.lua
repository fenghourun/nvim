local devicons_present, web_devicons = pcall(require, "nvim-web-devicons")

if not devicons_present then
  return
end

local M = {}

M.winbar_filetype_exclude = {
  "alpha",
  "neo-tree",
  "telescope",
}

function M.eval()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    return ""
  end

  local file_path = vim.fn.expand "%:~:.:h"
  local file_name = vim.api.nvim_eval_statusline("%t", {}).str
  local file_type = vim.fn.expand "%:e"

  -- File Icon
  local file_icon = web_devicons.get_icon(file_name, file_type, { default = true })
  local file_icon_hl = "%#" .. "DevIcon" .. file_type:gsub("^%l", string.upper) .. "#"
  local file_icon_with_hl = file_icon_hl .. file_icon

  -- Replace slashes with > and append one at the end
  file_path = file_path:gsub("/", " > ") .. " > "

  return "%#WinBarPath#"
    .. " "
    .. file_path
    .. " "
    .. file_icon_with_hl
    .. " "
    .. "%#WinBarFileName#"
    .. file_name
end

return M
