-- Built-in configs

require "latex"

local set_options = require "options"
local set_autocmds = require "confs.autocmds"
local set_keymaps = require "confs.keymaps"
local set_colorscheme = require "colorscheme"
local setup_plugins = require "plugins"

set_colorscheme()
set_options()
set_autocmds()
set_keymaps()
setup_plugins()

if vim.g.vscode then
  vim.cmd [[
    nnoremap zc :call VSCodeNotify('editor.fold')<CR>
    nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
    nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
    nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>

    function! MoveCursor(direction) abort
      if(reg_recording() == '' && reg_executing() == '')
        return 'g'.a:direction
      else
        return a:direction
      endif
    endfunction

    nmap <expr> j MoveCursor('j')
    nmap <expr> k MoveCursor('k')
  ]]
end
