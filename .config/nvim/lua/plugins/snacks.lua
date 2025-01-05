local function snacksIndentToggle()
  local s = require("snacks")
  if s.indent.enabled then
    s.indent.disable()
  else
    s.indent.enable()
  end
end

return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,

    keys = {
      { "<leader>rf",  function() Snacks.rename.rename_file() end, desc = "Rename file" },
      { "<leader>bdc", function() Snacks.bufdelete.delete() end,   desc = "Delete (close) buffer" },
    },

    opts = {
      rename = { enabled = true },
      bufdelete = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      statuscolumn = { enabled = true },
      gitbranch = {},
    },

    config = function(_, opts)
      local s = require("snacks")
      s.setup(opts)


      vim.api.nvim_create_user_command("ToggleIndent", snacksIndentToggle, {})
      vim.api.nvim_create_user_command("GitBrowse", function() s.gitbrowse() end, {})
    end,
  },
}
