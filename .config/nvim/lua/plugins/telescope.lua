return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Telescope
        local builtin = require("telescope.builtin")
        -- find_file as c-p
        vim.keymap.set("n", "<leader>fd", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find)
        vim.keymap.set("n", "<leader>fr", builtin.resume)
        vim.keymap.set("n", "<leader>gc", builtin.git_commits)
        vim.keymap.set("n", "<leader>gs", builtin.git_status)
    end
}

