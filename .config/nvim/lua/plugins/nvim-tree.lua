return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local tree = require("nvim-tree")
    local screen_height = vim.o.lines
    local screen_width = vim.o.columns
    local height = math.floor(screen_height * 0.75)
    local width = math.floor(screen_width * 0.60)
    local row = math.floor((screen_height - height) * 0.5)
    local col = math.floor((screen_width - width) * 0.5)

    tree.setup({
      bookmarks = {
        persist = true,
      },
      sort = {
          sorter = "case_sensitive",
      },
      view = {
        centralize_selection = true,
        number = true,
        relativenumber = true,
        -- float = {
        --   enable = true,
        --   open_win_config = {
        --     relative = "editor",
        --     border = "none",
        --     width  = width,
        --     height = screen_height,
        --     row = 0,
        --     col = col,
        --   },
        -- },
      },
      filters = {
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              open = "",
            },
            git = {
              untracked = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })

    local keymap = vim.keymap.set

    keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvim-tree" })
    keymap("n", "<leader>b", "<cmd>NvimTreeFocus<cr>", { desc = "Focus nvim-tree" })
    keymap("n", "<leader>v", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Open tree at cursor file" })
    keymap("n", "<leader>h", ":NvimTreeResizeLeft<cr>", { desc = "Shrink tree" })
    keymap("n", "<leader>l", ":NvimTreeResizeRight<cr>", { desc = "Widen tree" })
  end,
}
