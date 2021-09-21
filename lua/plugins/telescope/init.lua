local M = {}
M.__index = M

function M.init()
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd telescope-project.nvim]])
    vim.cmd([[packadd telescope-fzf-native.nvim]])
    vim.cmd([[packadd octo.nvim]])

    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            hidden = true,
            prompt_prefix = "🔍 ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "horizontal",
            file_sorter = require("telescope.sorters").get_generic_sorter,
            file_ignore_patterns = { ".git", "node_modules" },
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            winblend = 0,
            border = {},
            borderchars = {
                "─",
                "│",
                "─",
                "│",
                "╭",
                "╮",
                "╯",
                "╰",
            },
            color_devicons = true,
            use_less = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
        extensions = {
            fzf = {
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
            project = {
                base_dirs = { "~/code" },
                max_depth = 4,
                hidden_files = true,
            },
        },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("project")
    telescope.load_extension("dotfiles")
    telescope.load_extension("file_create")
    require("octo").setup()
end

return M
