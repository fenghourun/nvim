
vim.diagnostic.config({
   virtual_text = false,
})

vim.wo.wrap = false

vim.opt.termguicolors = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.number = true

vim.opt.cursorline = true

-- Tabs and spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Chars
vim.opt.list = true
vim.opt.listchars:append "space:⋅"

-- " Note the space after the /
vim.cmd[[
    set fillchars+=eob:\ 
]]

vim.opt.scrolloff = 20
vim.opt.laststatus = 3

-- Left padding
vim.opt.numberwidth = 3

-- Set sign column always show
vim.opt.signcolumn='yes:2'

vim.opt.cmdheight=0

vim.opt.timeoutlen=500
vim.opt.mouse='nvi'

vim.opt.winbar = "%{%v:lua.require('winbar').eval()%}"




