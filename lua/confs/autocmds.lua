local config_lualine = require "plugins.ui.lualine"
local config_ibl = require "plugins.ui.indent-blankline"
local set_colorscheme = require "colorscheme"

local function set_autocmds()
  -- Reapply custom highlights on background change without changing colorscheme
  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    callback = function()
      set_colorscheme()
      config_lualine()
      config_ibl()
    end,
  })

  -- Dont continue comments on next line after enter
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
      vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
  })

  -- Set syntax to shell for envrc
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.envrc",
    callback = function()
      vim.bo.syntax = "sh"
    end,
  })

  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank {
        higroup = "Visual",
        timeout = 300,
      }
    end,
  })

  -- Format on save via LSP
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then
        return
      end

      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format { bufnr = args.buf, async = false }
          end,
        })
      end
    end,
  })
end

return set_autocmds
