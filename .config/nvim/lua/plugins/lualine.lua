return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            { "buffers" },
          },
        },
      })
    end,
  },
}
