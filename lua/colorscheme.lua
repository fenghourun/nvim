-- Base theme
local set_base_colors = require "theme.integrations.base"
local set_neo_tree = require "theme.integrations.neo-tree"
local set_telescope = require "theme.integrations.telescope"
local set_barbar = require "theme.integrations.barbar"
local set_treesitter = require "theme.integrations.treesitter"
local set_git_signs = require "theme.integrations.gitsigns"
local set_which_key = require "theme.integrations.which-key"
local set_alpha = require "theme.integrations.alpha"
local set_notify = require "theme.integrations.notify"
local set_cmp = require "theme.integrations.cmp"
local set_ibl = require "theme.integrations.indent-blankline"

-- Custom
local set_winbar = require "theme.winbar"

function set_colorscheme()
  local get_colors = require 'theme.colors'
  local colors = get_colors()

  set_base_colors(colors)
  set_git_signs()
  set_cmp()
  set_treesitter()
  set_barbar()
  set_telescope()
  set_neo_tree()
  set_git_signs()
  set_which_key()
  set_alpha()
  set_notify()
  set_winbar()
  set_cmp()
  set_ibl()
end

return set_colorscheme