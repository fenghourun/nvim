local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr, async = false })
    end
  })
end

local on_attach_no_format = function(client, _bufnr)
  client.server_capabilities.documentFormattingProvider = false
end

local lsp_flags = {
  debounce_text_changes = 100,
}

lspconfig.ts_ls.setup {
  on_attach = function(client, _bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  flags = lsp_flags
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace'
      }
    },
  },
}

lspconfig.vimls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

lspconfig.biome.setup {
  on_attach = on_attach,
  flags = lsp_flags
}

lspconfig.ruff.setup {
  on_attach = on_attach,
  flags = lsp_flags
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  flags = lsp_flags
}
lspconfig.dockerls.setup {}
lspconfig.cssls.setup {}
lspconfig.leanls.setup { mappings = true }
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
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json"
        },
      }
    }
  }
}

lspconfig.taplo.setup {}
