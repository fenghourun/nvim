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
  vim.cmd [[autocmd FileType * set formatoptions-=cro]]

  -- Set syntax to shell for envrc
  vim.cmd [[autocmd BufNewFile,BufRead *.envrc set syntax=sh]]

  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank {
        higroup = "Visual",
        timeout = 300,
      }
    end,
  })

  -- Handled by conform
  -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if not client then
        return
      end
    end,
  })
end

return set_autocmds
