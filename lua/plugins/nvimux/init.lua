local M = {}

function M.init()
  local nvimux = require("nvimux")
  -- Nvimux configuration
  nvimux.setup({
    config = {
      prefix = "<C-a>",
      new_window = "enew", -- Use 'term' if you want to open a new term for every new window
      new_tab = nil, -- Defaults to new_window. Set to 'term' if you want a new term for every new tab
      new_window_buffer = "single",
      quickterm_direction = "botright",
      quickterm_orientation = "vertical",
      quickterm_scope = "t", -- Use 'g' for global quickterm
      quickterm_size = "80",
    },
    bindings = {
      { "s", ":NvimuxHorizontalSplit", { "n", "v", "i", "t" } },
      { "v", ":NvimuxVerticalSplit", { "n", "v", "i", "t" } },
    },
  })
end

return M
