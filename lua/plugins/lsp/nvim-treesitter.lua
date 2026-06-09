return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"
    ts.setup()

    -- Parsers to keep installed
    ts.install {
      "bash",
      "lua",
      "luadoc",
      "python",
      "typescript",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "rust",
      "gitcommit",
      "gitignore",
      "git_rebase",
      "git_config",
      "tsx",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
      "regex",
    }

    -- Enable highlighting + indentation wherever a parser is available
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        if ft == "latex" then
          return
        end
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if not pcall(vim.treesitter.start, ev.buf, lang) then
          return
        end
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
