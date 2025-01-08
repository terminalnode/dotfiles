return {
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte, frappe, macchiato, mocha
        dim_inactive = { enabled = false },
        integrations = {
          blink_cmp = true,
          noice = true,
          nvim_surround = true,
          snacks = true,
          telescope = { enabled = true },
          harpoon = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
