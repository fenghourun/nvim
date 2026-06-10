return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"
    ts.setup()

    -- Neovim 0.12 ships a Lua parser that matches its bundled Lua queries.
    -- Prefer it over stale nvim-treesitter parser builds that can shadow it.
    for _, parser in ipairs(vim.api.nvim_get_runtime_file("parser/lua.*", true)) do
      if not parser:find("/nvim%-treesitter/", 1, false) then
        vim.treesitter.language.add("lua", { path = parser })
        break
      end
    end

    local ensure_installed = {
      "bash",
      "luadoc",
      "python",
      "typescript",
      "javascript",
      "jsdoc",
      "json",
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

    local missing = {}
    for _, lang in ipairs(ensure_installed) do
      if #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", true) == 0 then
        table.insert(missing, lang)
      end
    end

    if #missing > 0 then
      ts.install(missing)
    end

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
