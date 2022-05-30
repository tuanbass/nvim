local lspconfig = require("lspconfig")
local lsp = require("config.plugins.configs.lspconfig")
local capabilities =
  require("config.plugins.configs.lspconfig.capabilities").capabilities

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
  end,
})
