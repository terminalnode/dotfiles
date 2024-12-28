return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      { "plenary.nvim" },
      { "telescope-fzf-native.nvim", build = "make" },
      { "ripgrep" },
    },
    config = function()
      local ts = require("telescope")
      local tsbin = require("telescope.builtin")

      ts.setup({
        pickers = {
          find_files = { theme = "ivy" },
          help_tags = { theme = "ivy" },
        },
        extensions = {
          fzf = {},
        },
      })
      ts.load_extension("fzf")

      vim.keymap.set("n", "<leader>tf", tsbin.find_files)
      vim.keymap.set("n", "<leader>th", tsbin.help_tags)
      vim.keymap.set("n", "<leader>tc", function() tsbin.find_files({ cwd = vim.fn.stdpath("config") }) end)
    end
  },
}
