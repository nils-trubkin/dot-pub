return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Choose your preferred flavor
      transparent_background = true,
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
