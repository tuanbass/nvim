local lspconfig = require("lspconfig")
local lsp = require("config.plugins.configs.lspconfig")
local capabilities =
  require("config.plugins.configs.lspconfig.capabilities").capabilities

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      local au_lsp = vim.api.nvim_create_augroup("rust_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
        group = au_lsp,
      })
    end
    lsp.on_attach(client, bufnr)
  end,
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      checkOnSave = {
        enable = true,
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
