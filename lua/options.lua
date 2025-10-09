local function set_options()
  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable underline, it's very annoying
      underline = true,
      virtual_text = false,
      -- Enable virtual text, override spacing to 4
      -- virtual_text = {spacing = 4},
      -- Use a function to dynamically turn signs off
      -- and on, using buffer local variables
      signs = true,
      update_in_insert = false,
    })

  vim.wo.wrap = true

  -- Folding
  function _G.customFoldText()
    -- local line = vim.fn.getline(vim.v.foldstart)
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return "     " .. line_count .. " lines"
  end

  vim.opt.foldtext = "v:lua.customFoldText()"
  vim.opt.foldmethod = "indent"
  vim.opt.foldminlines = 1
  vim.opt.foldlevelstart = 99

  --- Make status line global (away from nvimtree)
  vim.opt.laststatus = 3

  -- transparent background
  vim.o.pumblend = 5

  -- Case insensitive search
  vim.opt.ignorecase = true

  -- Search
  vim.opt.hlsearch = true
  vim.opt.incsearch = true
  vim.opt.termguicolors = true
  vim.opt.backspace = "indent,eol,start"
  vim.opt.number = true
  vim.opt.relativenumber = true

  vim.opt.cursorline = true

  -- Tabs and spaces
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.smartindent = true

  -- Chars
  vim.opt.encoding = "utf-8"
  -- vim.opt.list = true
  -- vim.opt.listchars:append "space:⋅"

  -- " Note the space after the /
  vim.opt.fillchars = { eob = " ", fold = " " }
  -- vim.cmd([[
  --    set fillchars+=fold:
  -- ]])

  vim.opt.clipboard = "unnamedplus"
  vim.opt.scrolloff = 10
  vim.opt.laststatus = 3

  -- Left padding
  vim.opt.numberwidth = 1

  -- Set sign column always show
  vim.opt.signcolumn = "yes:2"

  -- Cmdline replaces statusline
  vim.opt.cmdheight = 1

  vim.opt.timeoutlen = 500
  vim.opt.mouse = "nvi"

  -- backup
  vim.opt.backupcopy = "yes"

  -- vim.opt.winbar = "%{%v:lua.require('winbar').eval()%}"
  vim.g.neovide_scale_factor = 1.3
  vim.opt.linespace = 3
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_theme = "auto"
  vim.g.neovide_opacity = 0.9
end

return set_options
