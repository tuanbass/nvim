local M = {}

M.debug = {
  ["rcarriga/neotest"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },
  ["vim-test/vim-test"] = {
    cmd = { "TestFile" },
    requires = {
      {
        "neomake/neomake",
        cmd = { "Neomake" },
      },
      { "tpope/vim-dispatch", cmd = { "Dispatch" } },
    },
    wants = { "vim-dispatch", "neomake" },
  },
  ["jbyuki/one-small-step-for-vimkind"] = {},
  ["mfussenegger/nvim-dap-python"] = { opt = true },
  ["Pocco81/DAPInstall.nvim"] = {
    cmd = { "DIInstall", "DIList" },
    commit ="24923c3819a450a772bb8f675926d530e829665f",
    config = function()
      local dap_install = require("dap-install")

      dap_install.setup({
        installation_path = sep_os_replacer(
          vim.fn.stdpath("data") .. "/dapinstall/"
        ),
      })
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    opt = true,
  },
  ["rcarriga/nvim-dap-ui"] = {
    opt = true,
    requires = { "mfussenegger/nvim-dap" },
  },
}

return M
