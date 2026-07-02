local function set_options()
  vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }

  vim.wo.wrap = true

  -- Folding
  function _G.customFoldText()
    -- Show the folded block's first line so it's obvious what is collapsed,
    -- then a marker + line count so a fold is unmistakable at a glance.
    local start_line = vim.fn.getline(vim.v.foldstart)
    -- Expand tabs so the folded line keeps the surrounding indentation.
    start_line = start_line:gsub("\t", string.rep(" ", vim.o.tabstop))
    local line_count = vim.v.foldend - vim.v.foldstart + 1
    return start_line .. "  ⋯  " .. line_count .. " lines "
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
  vim.opt.fillchars = { eob = " ", fold = " " }

  vim.opt.clipboard = "unnamedplus"
  vim.opt.scrolloff = 10

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

  vim.g.neovide_scale_factor = 1.3
  vim.opt.linespace = 3
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_theme = "auto"
  vim.g.neovide_opacity = 0.9

  -- treat env files as bash
  vim.filetype.add {
    pattern = {
      [".*%.env.*"] = "sh", -- Treat .env files as 'sh' filetype
    },
  }
end

return set_options
