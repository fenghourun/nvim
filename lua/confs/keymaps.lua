local function set_keymaps()
  -- Leader
  vim.g.mapleader = " "

  --- Keybindings
  local opts = { noremap = true, silent = true }

  -- Editor
  -- Move highlighted
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

  vim.keymap.set("x", "<leader>p", '"_dP')

  vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", opts)

  -- Close qukcflix
  vim.keymap.set("n", "<leader>c", "<Cmd>cclose<CR>", opts)

  -- Clear search
  vim.keymap.set("n", "<Leader><Space>", ":noh<CR>", opts)

  -- Tab and Buffer
  vim.keymap.set("n", "<leader>w", "<Cmd>BufferWipeout!<cr>", opts)
  vim.keymap.set("n", "<leader>ot", "<Cmd>tabnew %<cr>", opts)
  vim.keymap.set("n", "<leader>ct", "<Cmd>tabclose<cr>", opts)

  -- Adjust pane size
  vim.keymap.set("n", "<S-Up>", "<cmd> :resize +1<cr>", opts)
  vim.keymap.set("n", "<S-Down>", "<cmd> :resize -1<cr>", opts)
  vim.keymap.set("n", "+", "<cmd> :vertical resize +1<cr>", opts)
  vim.keymap.set("n", "_", "<cmd> :vertical resize -1<cr>", opts)

  -- Toggle through command suggestions
  vim.cmd [[
	cnoremap <expr> <C-k> wildmenumode() ? "\<C-P>" : "\<Up>"
	cnoremap <expr> <C-j> wildmenumode() ? "\<C-N>" : "\<Down>"
]]

  -- Show all highlights
  vim.keymap.set("n", "<leader>hi", "<cmd>so $VIMRUNTIME/syntax/hitest.vim<cr><cr>", opts)

  -- WSL copy to windows clipboard
  vim.keymap.set("v", "<Leader>y", ":<C-U>'<,'>w !clip.exe<cr><cr>", opts)

  -- Telescope
  vim.keymap.set("n", "<C-p>", "<Cmd>Telescope find_files<CR>", opts)
  vim.keymap.set("n", "<C-f>", "<Cmd>Telescope live_grep<CR>", opts)

  -- Neo Tree
  vim.keymap.set("n", "<Leader>e", "<cmd>Neotree toggle reveal_force_cwd<cr>", opts)

  -- Bufferline
  vim.keymap.set("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>", opts)
  vim.keymap.set("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>", opts)
  vim.keymap.set("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>", opts)
  vim.keymap.set("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>", opts)
  vim.keymap.set("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>", opts)
  vim.keymap.set("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
  vim.keymap.set("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
  vim.keymap.set("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
  vim.keymap.set("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
  vim.keymap.set("n", "<S-h>", "<Cmd>BufferMovePrevious<CR>", opts)
  vim.keymap.set("n", "<S-l>", "<Cmd>BufferMoveNext<CR>", opts)

  -- LSP
  vim.keymap.set("n", "<C-d>", "<Cmd> lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "<C-h>", vim.lsp.buf.hover)

  -- Notifications
  -- vim.keymap.set('', '<Leader>d', "<Cmd> lua require('notify').dismiss() <CR>", { silent = true })

  -- Debug
  -- vim.keymap.set("n", "<C-b>", "<Cmd> lua require'dap'.toggle_breakpoint() <CR>", opts)
  -- vim.keymap.set("n", "<S-k>", "<Cmd> lua require'dap'.step_out() <CR>", opts)
  -- vim.keymap.set("n", "<S-l>", "<Cmd> lua require'dap'.step_into() <CR>", opts)
  -- vim.keymap.set('n', '<S-j>', '<Cmd> lua require\'dap\'.step_over() <CR>', opts)
  -- vim.keymap.set("n", "<leader>dc", "<Cmd> DapContinue <CR>")

  -- Dont save deletions
  -- vim.keymap.set("n", "c", '"_c', { noremap = true })
  -- vim.keymap.set("n", "d", '"_d', { noremap = true })
  -- vim.keymap.set("v", "d", '"_d', { noremap = true })
  -- vim.keymap.set("v", "c", '"_c', { noremap = true })
end

return set_keymaps
