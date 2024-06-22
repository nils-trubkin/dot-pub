return {
    'preservim/nerdtree',
    config = function()
        vim.g.NERDTreeShowHidden = 1 
        vim.g.NERDTreeMinimalUI = 1
        
        vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
        vim.keymap.set("n", "<C-n>", ":NERDTree<CR>")
        vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")
        vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")
    end
}
