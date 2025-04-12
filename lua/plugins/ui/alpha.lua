return {
  "goolord/alpha-nvim",
  config = function()
    local alpha_nvim = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
    local logo = [[
                       1
      ψ = 1 + ───────────────────
                         1
              1 + ───────────────
                           1
                  1 + ───────────
                             1
                      1 + ───────
                          1 + ...

    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("CTRL P", "  Find File  ", ":Telescope find_files<CR>"),
      dashboard.button("p", "   Configure plugins", ":Lazy <CR>"),
      dashboard.button("l", "   Configure lsp ", ":Mason <CR>"),
      dashboard.button("q", "   Quit Neovim", ":qa<CR>"),
    }

    -- Footer
    local function footer()
      local version = vim.version()
      local nvim_version_info = "  Neovim v"
        .. version.major
        .. "."
        .. version.minor
        .. "."
        .. version.patch
      return nvim_version_info
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "AlphaFooter"

    alpha_nvim.setup(dashboard.opts)
  end,
}
