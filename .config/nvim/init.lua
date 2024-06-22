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

local set = vim.opt  -- Initialize options
set.number = true  -- Show line numbers
set.relativenumber = true  -- Show relative line numbers
set.expandtab = true  -- Convert tabs to spaces
set.shiftwidth = 4  -- Use 4 spaces for each step of (auto)indent
set.tabstop = 4  -- Use 4 spaces for a <Tab>
vim.g.mapleader = " "  -- Leader to <Space>
-- Optional: Set other indentation-related options
set.softtabstop = 4  -- Number of spaces that a <Tab> counts for while performing editing operations
set.autoindent = true  -- Copy indent from the current line when starting a new line
set.smartindent = true  -- Insert indents automatically
vim.keymap.set("n", "<leader>h", ":set hlsearch!<CR>")  -- No hls
-- Resize with Ctrl + arrow keys
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
-- Lazy loading
require("lazy").setup("plugins")

