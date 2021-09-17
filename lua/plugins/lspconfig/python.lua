local lspconfig = require("lspconfig")
local lsp = require("plugins.lspconfig")
local capabilities = require("plugins.lspStatus").capabilities

lspconfig.pyright.setup {
    capabilities = capabilities,
    flags = {debounce_text_changes = 500},
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        lsp:on_attach(client, bufnr)
    end
}
