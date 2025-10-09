local telescope = require "plugins.coding.telescope"
local neotree = require "plugins.coding.snacks"
local lean = require "plugins.coding.lean"

return {
  telescope,
  neotree,
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  lean,
}
