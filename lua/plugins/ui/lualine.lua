local config_lualine = function()
  local icons = require "theme.icons"
  local get_colors = require "theme.colors"
  local colors = get_colors()
  local custom_theme = {
    normal = {
      a = { fg = colors.lualine_normal_foreground, bg = colors.lualine_mode_background },
      c = { fg = colors.red, bg = colors.lualine_background },
      x = { fg = colors.red, bg = colors.lualine_background },
      z = { fg = colors.red, bg = colors.background_dark },
    },
    insert = {
      a = { fg = colors.lualine_insert_foreground, bg = colors.background },
      c = { fg = colors.red, bg = colors.lualine_background },
      x = { fg = colors.red, bg = colors.lualine_background },
      z = { fg = colors.dark_green, bg = colors.background },
    },
    visual = {
      a = { fg = colors.dark_blue, bg = colors.lualine_background },
      c = { fg = colors.red, bg = colors.lualine_background },
      x = { fg = colors.red, bg = colors.lualine_background },
      z = { fg = colors.dark_blue, bg = colors.lualine_background_dark },
    },
    replace = {
      a = { fg = colors.cyan, bg = colors.lualine_background },
      c = { fg = colors.red, bg = colors.lualine_background },
      x = { fg = colors.red, bg = colors.lualine_background },
      z = { fg = colors.cyan, bg = colors.lualine_background_dark },
    },
    inactive = {
      a = { fg = colors.grey, bg = colors.lualine_background },
      c = { fg = colors.red, bg = colors.lualine_background },
      x = { fg = colors.red, bg = colors.lualine_background },
      z = { fg = colors.grey, bg = colors.lualine_background },
    },
  }

  vim.api.nvim_set_hl(0, "LuaLineDiffAdd", { fg = colors.lualine_diff_add })
  vim.api.nvim_set_hl(0, "LuaLineDiffChange", { fg = colors.lualine_diff_change })
  vim.api.nvim_set_hl(0, "LuaLineDiffDelete", { fg = colors.lualine_diff_delete })

  local lualine_present, lualine = pcall(require, "lualine")
  if not lualine_present then
    return
  end

  lualine.setup {
    options = {
      icons_enabled = true,
      theme = custom_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          function()
            return "▊"
          end,
          padding = { right = 1 }, -- We don't need space before this
        },
        { "mode" },
      },
      lualine_b = {},
      lualine_c = {
        {
          "branch",
          color = { fg = colors.lualine_branch },
          padding = { left = 3 },
        },
        {
          "filetype",
          colored = true, -- Displays filetype icon in color if set to true
          icon_only = false, -- Display only an icon for filetype
          icon = { align = "left", color = { fg = colors.black } }, -- Display filetype icon on the right hand side
          color = { fg = colors.lualine_filetype_foreground },
          padding = { left = 3 },
        },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          padding = { left = 3 },
        },
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
          padding = { left = 3 },
        },
      },
      lualine_x = {
        {
          -- Lsp server name .
          function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = " ",
          color = { fg = colors.lualine_lsp_foreground },
        },
        {
          "location",
          color = { fg = colors.lualine_location_foreground },
        },
        {
          "progress",
          color = { fg = colors.lualine_progress_foreground },
        },
      },
      lualine_y = {},
      lualine_z = {
        {
          function()
            return "▊"
          end,
          padding = { left = 1 }, -- We don't need space before this
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

return config_lualine
