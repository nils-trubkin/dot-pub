return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "css", "json", "typescript", "yaml", "python", "java", "bash", "cpp", "cmake", "dockerfile", "haskell", "kotlin", "regex", "rust" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

