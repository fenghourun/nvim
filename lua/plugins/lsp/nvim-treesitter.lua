return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"
    -- The main branch installs both parsers and queries here.  Registering the
    -- directory is essential: it puts matching parser/query pairs ahead of the
    -- legacy parser files still present in the plugin directory.
    ts.setup {
      install_dir = vim.fn.stdpath "data" .. "/site",
    }

    -- Neovim 0.12 ships parsers (lua, vim, ...) that match its bundled queries.
    -- Prefer them over stale nvim-treesitter parser builds that can shadow them
    -- and cause "Invalid node type" query errors (e.g. the noice cmdline + the
    -- vim parser hitting the bundled query's "tab" node).
    for _, lang in ipairs { "lua", "vim" } do
      for _, parser in ipairs(vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", true)) do
        if not parser:find("/nvim%-treesitter/", 1, false) then
          vim.treesitter.language.add(lang, { path = parser })
          break
        end
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

    -- Installing parsers opens download/build watchers.  Do not do that while
    -- Neovim is starting: concurrent startup watchers can otherwise raise
    -- EMFILE.  lazy.nvim runs :TSUpdate after plugin updates; this command is
    -- available for the initial install (or to add the whole configured set).
    vim.api.nvim_create_user_command("TSInstallConfigured", function()
      ts.install(ensure_installed, { max_jobs = 1 })
    end, { desc = "Install this config's Tree-sitter parsers" })

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
