-- lazy vim
local function setup_plugins()
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  local coding_plugins = require "plugins.coding.init"
  local lsp_plugins = require "plugins.lsp.init"
  local setup_ui_plugins = require "plugins.ui.init"

  local ui_plugins = setup_ui_plugins()

  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    }
  end

  vim.opt.rtp:prepend(lazypath)

  local plugins = {
    ui_plugins,
    coding_plugins,
    lsp_plugins,
  }

  require("lazy").setup(plugins)

  -- setup lsp Installer before lspconfig
  require "confs.lspconfig"

  -- Debugger
  require "confs.nvim-dap"
  require "confs.dap-ui"
end

return setup_plugins
