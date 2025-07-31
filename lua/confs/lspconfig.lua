local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format { bufnr = bufnr, async = false }
    end,
  })
end

local on_attach_no_format = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

local lsp_flags = {
  debounce_text_changes = 100,
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
    })
  end,
  settings = {
    Lua = {
      type = {
        -- Enable type annotations
        weakUnionCheck = false,
        weakNilCheck = false,
        castNumberToInteger = false,
      },
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          vim.env.VIMRUNTIME,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.vimls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}
lspconfig.dockerls.setup {}
lspconfig.cssls.setup {}
lspconfig.somesass_ls.setup {}
lspconfig.jsonls.setup {
  on_attach = on_attach_no_format,
  flags = lsp_flags,
  settings = {
    json = {
      validate = { enable = true },
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
    },
  },
}

lspconfig.taplo.setup {}
