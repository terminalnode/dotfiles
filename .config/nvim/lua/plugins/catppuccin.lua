return {
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte, frappe, macchiato, mocha
        dim_inactive = { enabled = true },
        integrations = {
          blink_cmp = true,
          noice = true,
          nvim_surround = true,
          snacks = true,
          telescope = { enabled = true },
        },
      })
      vim.cmd.colorscheme("catppuccin-latte")
    end,
  },
}
