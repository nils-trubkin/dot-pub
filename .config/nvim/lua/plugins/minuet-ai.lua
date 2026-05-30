return {
    "milanglacier/minuet-ai.nvim",
    config = function()
        require("minuet").setup({
            duet = {
                provider = 'openai_compatible',
                provider_options = {
                    openai_compatible = {
                        api_key = "OPENAI_API_KEY", -- ignored but required field
                        name = "Ollama",
                        end_point = "http://localhost:11434/v1/chat/completions",
                        model = "qwen2.5-coder:14b",
                        optional = {
                            temperature = 0.2,
                            max_tokens = 512,
                        },
                    },
                },
                request_timeout = 15,
            },
            provider = 'openai_fim_compatible',
            n_completions = 3, -- recommend for local model for resource saving
            -- I recommend beginning with a small context window size and incrementally
            -- expanding it, depending on your local computing power. A context window
            -- of 512, serves as an good starting point to estimate your computing
            -- power. Once you have a reliable estimate of your local computing power,
            -- you should adjust the context window to a larger value.
            context_window = 16384,
            provider_options = {
                openai_fim_compatible = {
                    -- For Windows users, TERM may not be present in environment variables.
                    -- Consider using APPDATA instead.
                    api_key = 'TERM',
                    name = 'Ollama',
                    end_point = 'http://localhost:11434/v1/completions',
                    model = 'qwen2.5-coder:7b',
                    optional = {
                        max_tokens = 56,
                        top_p = 0.9,
                    },
                },
            },
            virtualtext = {
                auto_trigger_ft = { 'python', 'lua' },
                keymap = {
                    accept = "<A-;>",      -- accept whole suggestion
                    accept_line = "<A-l>", -- accept next line
                    next = "<A-j>",        -- next suggestion
                    prev = "<A-k>",        -- previous suggestion
                    dismiss = "<A-h>",     -- dismiss suggestion
                },
            }
        })

        vim.keymap.set("i", "<A-q>", "<cmd>Minuet duet predict<cr>", { desc = "Minuet duet predict" })
        vim.keymap.set("i", "<A-a>", "<cmd>Minuet duet apply<cr>", { desc = "Minuet duet apply" })
        vim.keymap.set("i", "<A-x>", "<cmd>Minuet duet dismiss<cr>", { desc = "Minuet duet dismiss" })
        vim.keymap.set("i", "<A-t>", "<cmd>Minuet virtualtext toggle<cr>", { desc = "Minuet virtualtext toggle" })
    end,
}
