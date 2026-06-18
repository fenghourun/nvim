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
      vim.hl.on_yank {
        higroup = "Visual",
        timeout = 300,
      }
    end,
  })

  -- Format on save via LSP
  local format_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then
        return
      end

      if client:supports_method "textDocument/formatting" then
        -- Clear any existing hook for this buffer first so multiple LSP clients
        -- attaching (e.g. ts_ls + biome) don't stack and format the buffer twice.
        vim.api.nvim_clear_autocmds { group = format_group, buffer = args.buf }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_group,
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format { bufnr = args.buf, async = false }
          end,
        })
      end

      -- Enable inlay hints for Lean only (for now)
      if client.name == "leanls" and client:supports_method "textDocument/inlayHint" then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end
    end,
  })
end

return set_autocmds
