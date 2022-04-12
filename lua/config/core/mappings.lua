local remap = require("config.utils").map_global
local M = {}

function M.mappings()
  -- general
  remap("v", "J", ":m '>+1<CR>gv=gv") -- move lines
  remap("v", "K", ":m '<-2<CR>gv=gv") -- move lines
  remap("v", "<leader>p", '"_dP') -- delete into blackhole and past last yank
  remap("n", "<leader>Y", 'gg"+yG') -- copy hole biffer
  remap("n", "<leader>D", '"_d') -- delete into blackhole register
  remap("v", "<leader>D", '"_d') -- delete into blackhole register
  remap("n", "<C-d>", "<C-d>zz") -- move and center
  remap("n", "<C-u>", "<C-u>zz") -- move and center
  remap("i", "jj", "<ESC>") -- normal mode map

  -- quickfix
  remap("n", "<Leader>qo", ":lua require('config.utils').toggle_qf()<CR>")
  remap("n", "<Leader>qn", ":cnext<CR>")
  remap("n", "<Leader>qp", ":cprev<CR>")

  -- locationlist
  remap("n", "<Leader>lc", ":lclose<CR>")
  remap("n", "<Leader>lo", ":lopen<CR>")
  remap("n", "<Leader>ln", ":lnext<CR>")
  remap("n", "<Leader>lp", ":lprev<CR>")

  -- cmdline
  remap("n", "<C-p>", "<cmd>FineCmdline<CR>")

  -- telescope NOTE: Lazyloaded
  remap(
    "n",
    "<Leader>ff",
    "<Cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>"
  )
  remap("n", "<Leader>fg", ":Telescope live_grep<CR>")
  remap("n", "<Leader>fb", ":Telescope file_browser<CR>")
  remap("n", "<Leader>gf", ":Telescope lsp_code_actions theme=cursor<CR>")
  remap("n", "<Leader>fs", ":Telescope git_status<CR>")
  --remap("n", "<Leader>fb", ":Telescope buffers<CR>")
  remap("n", "<Leader>fh", ":Telescope help_tags<CR>")
  remap("n", "<Leader>fo", ":Telescope oldfiles<CR>")
  remap("n", "<Leader>fp", ":Telescope project<CR>")

  -- nvim tree NOTE: Lazyloaded
  remap("n", "<Leader>n", ":NvimTreeFindFile<CR>")
  remap("n", "<C-n>", ":NvimTreeToggle<CR>")

  -- dap NOTE: Lazyloaded
  remap(
    "n",
    "<Leader>dc",
    [[ <Cmd>lua require("config.plugins.dap.attach"):addPlug(); require'dap'.continue()<CR>]]
  )
  remap(
    "n",
    "<Leader>db",
    [[ <Cmd>lua require("config.plugins.dap.attach"):addPlug(); require'dap'.toggle_breakpoint()<CR>]]
  )

  -- gitlinker: NOTE: Lazyloaded
  remap(
    "n",
    "<Leader>gy",
    [[ <Cmd>lua require('config.plugins.gitlinker'):normal()<CR>]]
  )
  remap(
    "v",
    "<Leader>gy",
    [[ <Cmd>lua require('config.plugins.gitlinker'):visual()<CR>]]
  )

  -- refactor: NOTE: Lazyloaded
  remap(
    "v",
    "<Leader>re",
    [[ <Cmd>lua require('config.plugins.refactoring').extract()<CR>]]
  )
  remap(
    "v",
    "<Leader>rf",
    [[ <Cmd>lua require('config.plugins.refactoring').extract_to_file()<CR>]]
  )
  remap(
    "v",
    "<Leader>rt",
    [[<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]]
  )

  -- marker: NOTE: Lazyloaded
  remap("v", "<Leader>1", ":<c-u>HSHighlight 1<CR>")
  remap("v", "<Leader>2", ":<c-u>HSHighlight 2<CR>")
  remap("v", "<Leader>3", ":<c-u>HSHighlight 3<CR>")
  remap("v", "<Leader>4", ":<c-u>HSHighlight 4<CR>")
  remap("v", "<Leader>5", ":<c-u>HSHighlight 5<CR>")
  remap("v", "<Leader>6", ":<c-u>HSHighlight 6<CR>")
  remap("v", "<Leader>7", ":<c-u>HSHighlight 7<CR>")
  remap("v", "<Leader>8", ":<c-u>HSHighlight 8<CR>")
  remap("v", "<Leader>9", ":<c-u>HSHighlight 9<CR>")
  remap("v", "<Leader>0", ":<c-u>HSRmHighlight<CR>")

  -- trouble
  remap("n", "<Leader>gt", ":LspTroubleToggle<CR>")

  -- make
  remap("n", "<Leader>ms", ":Neomake<CR>")
  remap("n", "<Leader>mt", ":TestFile<CR>")
  remap("n", "<Leader>mu", ":Ultest<CR>")

  -- neogen
  remap("n", "<Leader>nf", ":DocGen<CR>")

  -- Move to window, or swap by using shift + letter
  vim.keymap.set("n", "<Leader>w", ":WindowPick<CR>")

  -- Swap with any window
  -- vim.api.nvim_set_keymap("n", "<leader>ws", "WindowSwap")
  -- vim.api.nvim_set_keymap("n", "<leader>wq", "WindowZap")

  -- utility binds
  vim.keymap.set("n", "<A-h>", ":vert resize +5<CR>")
  vim.keymap.set("n", "<A-j>", ":resize  +5<CR>")
  vim.keymap.set("n", "<A-k>", ":resize  -5<CR>")
  vim.keymap.set("n", "<A-l>", ":vert resize -5<CR>")
  vim.keymap.set({ "n" }, "<leader>r", function()
    require("config.core.global").reload()
  end, {
    silent = false,
  })
  vim.keymap.set(
    { "n" },
    "<leader>uf",
    require("config.core.options").fold_column_toggle,
    {
      silent = true,
    }
  )
  vim.keymap.set(
    { "n" },
    "<leader>ur",
    require("config.core.options").relative_position_toggle,
    {
      silent = true,
    }
  )
  vim.keymap.set(
    { "n" },
    "<leader>un",
    require("config.core.options").number_toggle,
    {
      silent = true,
    }
  )
  vim.keymap.set(
    { "n" },
    "<leader>us",
    require("config.core.options").spell_toggle,
    {
      silent = true,
    }
  )
end

return M