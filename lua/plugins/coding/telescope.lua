return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"

    return {
      defaults = {
        path_display = { "truncate" },
        prompt_prefix = "🔍  ",
        selection_caret = "  ",
        entry_prefix = "   ",
        sorting_strategy = "ascending",
        -- @TODO doesn't work
        file_ignore_patterns = {
          "node_modules/",
          "**/package%-lock.json",
          ".git/",
          "dist/",
          ".turbo/",
          "lazy%-lock.json",
          "target/",
        },
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
          vertical = {
            prompt_position = "top",
          },
          width = 100,
          height = 30,
          preview_height = 5,
          preview_cutoff = 1,
        },
        color_devicons = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<Esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "fd",
            "-t",
            "f",
            "-H",
            "--no-ignore-vcs",
          },
          previewer = false,
        },
        live_grep = {
          shorten_path = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    }
  end,
  init = function()
    require("telescope").load_extension "fzf"
  end,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}
