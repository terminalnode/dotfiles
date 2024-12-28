return {
  {
    'stevearc/oil.nvim',
    keys = {
      { "-", "<Cmd>Oil<CR>", desc = "Run oil" },
    },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "mini.icons" }, -- Can also use nvim-web-devicons
  }
}
