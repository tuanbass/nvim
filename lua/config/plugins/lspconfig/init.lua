local map = require("config.utils").map
local fn = vim.fn

local LSP = {}
LSP.__index = LSP

-- custom attach config for most LSP configs
function LSP.on_attach(client, bufnr)
  if
    packer_plugins["lsp_signature.nvim"]
    and not packer_plugins["lsp_signature.nvim"].loaded
  then
    vim.cmd([[packadd lsp_signature.nvim]])
  end

  if
    packer_plugins["lsp-status.nvim"]
    and packer_plugins["lsp-status.nvim"].loaded
  then
    local lsp_status = require("config.plugins.lspStatus").lsp_status
    lsp_status.on_attach(client)
  end

  map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map(bufnr, "n", "<C-w>gd", "<cmd>split | lua vim.lsp.buf.definition()<CR>")
  map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map(
    bufnr,
    "n",
    "<C-w>gi",
    "<cmd>split | lua vim.lsp.buf.implementation()<CR>"
  )
  map(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  map(bufnr, "n", "<space>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  map(bufnr, "n", "<space>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  map(bufnr, "n", "<space>gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map(
    bufnr,
    "n",
    "<space>gr",
    "<cmd>lua require('config.plugins.lspconfig.utils').rename()<CR>"
  )
  map(bufnr, "n", "<space>g=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  map(bufnr, "n", "<space>gi", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
  map(bufnr, "n", "<space>go", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")
  map(
    bufnr,
    "n",
    "<space>gd",
    "<cmd>lua vim.diagnostic.open_float({focusable = false, border = 'single' })<CR>"
  )

  fn.sign_define(
    "DiagnosticSignError",
    { texthl = "DiagnosticError", text = " " }
  )
  fn.sign_define(
    "DiagnosticSignWarn",
    { texthl = "DiagnosticWarn", text = " " }
  )
  fn.sign_define(
    "DiagnosticSignInfo",
    { texthl = "DiagnosticInfo", text = " " }
  )
  fn.sign_define(
    "DiagnosticSignHint",
    { texthl = "DiagnosticHint", text = " " }
  )

  if
    packer_plugins["lsp_signature.nvim"]
    and packer_plugins["lsp_signature.nvim"].loaded
  then
    require("lsp_signature").on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      -- If you want to hook lspsaga or other signature handler, pls set to false
      doc_lines = 6, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
      -- set to 0 if you DO NOT want any API comments be shown
      -- This setting only take effect in insert mode, it does not affect signature help in normal
      -- mode
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      hint_enable = true, -- virtual hint enable
      hint_prefix = "", -- Panda for parameter
      hint_scheme = "String",
      use_lspsaga = false, -- set to true if you want to use lspsaga popup
      hi_parameter = "FloatBorder", -- how your parameter will be highlight
      handler_opts = {
        border = "single", -- double, single, shadow, none
      },
      -- deprecate
      -- decorator = {"`", "`"}  -- decoractor can be `decorator = {"***", "***"}`  `decorator = {"**", "**"}` `decorator = {"**_", "_**"}`
      -- `decorator = {"*", "*"} see markdown help for more details
      -- <u></u> ~ ~ does not supported by nvim
    })
  end
end

-- LSP Settings
function LSP.settings()
  vim.diagnostic.config({ virtual_text = false })
  -- enable border for hover
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single",
  })

  -- enable border for signature
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
      border = "single",
    }
  )

  -- disable virtual text
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
    }
  )
end

LSP.settings()

-- init lsp config
function LSP.init()
  -- the server files
  local servers = {
    "lua",
    "rust",
    "groovy",
    "python",
    "css",
    "cs",
    "go",
    "docker",
    "yaml",
    "bash",
    -- "eslint",
    "ts",
    "java",
    "php",
    "efm",
    "c",
  }

  -- init lspStatus
  require("config.plugins.lspStatus").init()

  -- load lsp configs for languages
  for _, server in ipairs(servers) do
    local settings = { lsp_config = "config.plugins.lspconfig." .. server }
    require(settings.lsp_config)
  end
end

return LSP