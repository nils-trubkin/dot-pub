local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize options
local set = vim.opt

-- Convert tabs to spaces
set.expandtab = true
-- Use 4 spaces for each step of (auto)indent
set.shiftwidth = 4
-- Use 4 spaces for a <Tab>
set.tabstop = 4
-- Leader to <Space>
vim.g.mapleader = " "
-- Optional: Set other indentation-related options
set.softtabstop = 4  -- Number of spaces that a <Tab> counts for while performing editing operations
set.autoindent = true  -- Copy indent from the current line when starting a new line
set.smartindent = true  -- Insert indents automatically

-- Lazy loading
require("lazy").setup("plugins")

-- Telescope
local builtin = require("telescope.builtin")
-- find_file as c-p
vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)

-- Navigate nvim panes better (not needed with nvim-tmux-navigator)
--vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
--vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
--vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
--vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- No hls
vim.keymap.set("n", "<leader>h", ":set hlsearch!<CR>")

-- NERDTree
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>")
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")
