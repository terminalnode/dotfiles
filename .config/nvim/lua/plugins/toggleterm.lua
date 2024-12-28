return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<C-t>]],
      start_in_insert = true,
      shade_terminals = true,
      direction = "float",
      shell = vim.o.shell,
      float_opts = {
        border  = "curved",
        title_pos = "center",
      }
    },
  },
}
