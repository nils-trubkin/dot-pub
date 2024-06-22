return {
    'preservim/nerdtree',
    dependencies = {
        'ryanoasis/vim-devicons',
    },
    priority = 100,
    config = function()
        vim.g.NERDTreeShowHidden = 1 
        vim.g.NERDTreeMinimalUI = 1
        vim.g.NERDTreeAutoCenter = 1
        vim.g.NERDTreeAutoCenterThreshold = 30
        vim.g.NERDTreeDirArrowExpandable = ''
        vim.g.NERDTreeDirArrowCollapsible = ''
        
        vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
        vim.keymap.set("n", "<C-n>", ":NERDTree<CR>")
        vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")
        vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")
    end
}
