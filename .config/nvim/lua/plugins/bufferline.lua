return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "snacks.nvim" },
    event = "VeryLazy",
    keys = {
      -- Pin / Mark
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      -- Delete
      { "<leader>bdc", function() require("snacks").bufdelete() end, desc = "Close the current buffer" },
      { "<leader>bdp", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>bdl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bdh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      -- Cycle or Cycle buffers
      { "<C-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<leader>bmh", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "<C-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "<leader>bml", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = { options = {
      always_show_bufferline = false,
      close_command = function(n) require("snacks").bufdelete(n) end,
    } },
    config = function(_, opts) require("bufferline").setup(opts) end,
  },
}
