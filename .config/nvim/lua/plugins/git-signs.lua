return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    priority = 500,
    config = function()
        require("gitsigns").setup({
            current_line_blame = true
        })
        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
            fg = "#7c7c7c",
            italic = true,
    })
    end
}
