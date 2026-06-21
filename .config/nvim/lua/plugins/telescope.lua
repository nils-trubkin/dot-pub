return {
    'nvim-telescope/telescope.nvim',  
    event = "VeryLazy",
    dependencies = { 
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },
    config = function()
        -- Telescope
        local telescope = require('telescope')
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")
        -- Mappings
        vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep in files" })
        vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
        vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last Telescope action" })
        vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
        vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" }) 
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
        vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
        vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set("n", "<leader>q",  builtin.quickfix, { desc = "Open quickfix list" })
        vim.keymap.set("n", "<leader>mp", builtin.man_pages, { desc = "Man pages" })
        vim.keymap.set("n", "<leader>mr", builtin.registers, { desc = "Registers" })
        vim.keymap.set("n", "<leader>t", builtin.tags, { desc = "Tags" })
        vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Keymaps" })
        -- quickfix navigation
        vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
        vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
        vim.keymap.set("n", "<A-q>", "<cmd>cclose<CR>", { desc = "Close quickfix list" })
        vim.keymap.set("n", "<A-a>", "<cmd>copen<CR>", { desc = "Open quickfix list" })
        telescope.setup({
            defaults = {
                prompt_prefix = "🟄 ",
                selection_caret = "- ",
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-u>"] = false,
                        ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                        ["<C-s>"] = actions.cycle_previewers_next,
                        ["<C-a>"] = actions.cycle_previewers_prev,
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview,
                    },
                },
            }
        })
        telescope.load_extension("fzf")
    end
}

