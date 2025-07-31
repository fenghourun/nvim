return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    statuscolumn = {
      enabled = true,
      left = { "mark", "sign" }, -- priority of signs on the left (high to low)
      right = { "fold", "git" }, -- priority of signs on the right (high to low)
      folds = {
        open = false, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
    },
    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      replace_netrw = true,
    },
    scroll = { enabled = true },
    picker = {
      sources = {
        explorer = {
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
          layout = { layout = { position = "bottom" } },
        },
      },
    },
  },
}
