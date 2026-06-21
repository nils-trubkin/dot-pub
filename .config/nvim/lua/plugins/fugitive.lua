return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  config = function()
    local map = vim.keymap.set

    -- =========================
    -- CORE GIT COMMANDS
    -- =========================
    map("n", "<leader>Gs", "<cmd>Git<cr>", { desc = "Git status" })
    map("n", "<leader>Gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff split" })
    map("n", "<leader>GD", "<cmd>Gvdiffsplit<cr>", { desc = "Git diff vertical" })
    map("n", "<leader>Gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
    map("n", "<leader>Gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
    map("n", "<leader>Ga", "<cmd>Git add .<cr>", { desc = "Git add all" })

    -- =========================
    -- DIFF NAVIGATION
    -- =========================
    map("n", "]c", "]c", { desc = "Next diff hunk" })
    map("n", "[c", "[c", { desc = "Previous diff hunk" })

    -- =========================
    -- HUNK STAGING
    -- =========================
    map("n", "<leader>hs", "<cmd>diffput<cr>", { desc = "Stage hunk" })
    map("n", "<leader>hu", "<cmd>diffget<cr>", { desc = "Unstage hunk" })
    map("n", "<leader>hS", "<cmd>Gwrite<cr>", { desc = "Stage file" })
    map("n", "<leader>hr", "<cmd>diffupdate<cr>", { desc = "Refresh diff" })
  end,
}
