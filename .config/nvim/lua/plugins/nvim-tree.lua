return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local tree = require("nvim-tree")

    tree.setup({
      sort = {
          sorter = "case_sensitive",
      },
      view = {
        width = 35,
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
