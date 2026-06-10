return {
  "Julian/lean.nvim",
  event = { "BufReadPre *.lean", "BufNewFile *.lean" },

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    -- you also will likely want nvim-cmp or some completion engine
  },

  -- The Lean language server is not a Mason package; it ships with the Lean
  -- toolchain, which is managed by `elan` (Lean's rustup-style version manager).
  -- Bootstrap elan + a default toolchain on plugin install/update so that
  -- `lake serve` / `lean --server` is available without any manual setup.
  build = function()
    if vim.fn.executable "elan" == 1 then
      return
    end
    vim.notify(
      "lean.nvim: installing elan (Lean toolchain + language server)…",
      vim.log.levels.INFO
    )
    local cmd = "curl -sSf https://elan.lean-lang.org/elan-init.sh "
      .. "| sh -s -- -y --default-toolchain stable"
    local out = vim.fn.system { "sh", "-c", cmd }
    if vim.v.shell_error ~= 0 then
      error("lean.nvim: failed to install elan:\n" .. out)
    end
  end,

  -- elan installs to ~/.elan/bin, which Neovim's PATH usually won't include
  -- unless the shell profile has been re-sourced. Add it so the language server
  -- is discoverable in the current session. Runs at startup (lazy-load safe).
  init = function()
    local elan_bin = vim.fn.expand "~/.elan/bin"
    if
      vim.fn.isdirectory(elan_bin) == 1
      and not string.find(vim.env.PATH or "", elan_bin, 1, true)
    then
      vim.env.PATH = elan_bin .. ":" .. (vim.env.PATH or "")
    end
  end,

  ---@module 'lean'
  ---@type lean.Config
  opts = {
    lsp = {},
    goal_markers = {
      accomplished = "",
    },
    mappings = true,
  },
}
