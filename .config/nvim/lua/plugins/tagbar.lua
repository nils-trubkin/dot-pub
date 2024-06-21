return {
    "preservim/tagbar",
    config = function()
        vim.keymap.set("n", "<C-g>", ":TagbarToggle<CR>")
    end
}
