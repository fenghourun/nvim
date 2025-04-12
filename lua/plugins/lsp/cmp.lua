local kind_icons = require "theme.icons"

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
  },
  config = function()
    local cmp = require "cmp"
    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ["<S-k>"] = cmp.mapping.scroll_docs(-1),
        ["<S-j>"] = cmp.mapping.scroll_docs(1),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm { select = false },
      },
      formatting = {
        expandable_indicator = true,
        format = function(entry, vim_item)
          vim_item.kind =
            string.format("   %s %s    ", kind_icons.kinds[vim_item.kind], vim_item.kind)
          vim_item.menu = ({
            buffer = "Buf",
            nvim_lsp = "Lsp",
            nvim_lua = "Lua",
          })[entry.source.name]

          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        -- { name = "buffer" },
        { name = "path" },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = {
          border = nil,
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          side_padding = 1,
          max_width = 0,
        },
        documentation = {
          border = nil,
          winhighlight = "Normal:CmpDocPmenu",
        },
      },
      experimental = {
        ghost_text = false,
      },
    }
  end,
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, {
      name = "lazydev",
      group_index = 0, -- set group index to 0 to skip loading LuaLS completions
    })
  end,
}
