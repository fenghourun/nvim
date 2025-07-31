local function setup_ui_plugins()
  local alpha = require "plugins.ui.alpha"
  local config_noice = require "plugins.ui.noice"
  local gitsigns = require "plugins.ui.gitsigns"
  local colorizer = require "plugins.ui.colorizer"
  local config_lualine = require "plugins.ui.lualine"
  local config_ibl = require "plugins.ui.indent-blankline"
  local scrollview = require "plugins.ui.scrollview"
  local config_barbar = require "plugins.ui.barbar"

  return {
    {

      "folke/noice.nvim",
      event = "VeryLazy",
      config = config_noice,
      -- dependencies = {
      -- "MunifTanjim/nui.nvim",
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
      -- },
    },
    alpha,
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
    },
    gitsigns,
    { "goolord/alpha-nvim" },
    {
      "echasnovski/mini.nvim",
      version = "*",
      config = function()
        local mini_icons = require "mini.icons"
        mini_icons.setup()
        mini_icons.mock_nvim_web_devicons()
      end,
    },
    {
      "romgrk/barbar.nvim",
      config = config_barbar,
      -- TODO: Use mini.icons instead
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      config = config_ibl,
    },
    colorizer,
    {
      "nvim-lualine/lualine.nvim",
      config = config_lualine,
    },
    scrollview,
  }
end

return setup_ui_plugins
