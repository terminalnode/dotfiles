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
      indent = {
        enabled = true,
        chunk = {
          enabled = true,
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
          },
        },
        filter = function(buf)
          local ft = vim.bo[buf].filetype
          local excluded_filetypes = { "markdown", "text", "help" }

          return vim.g.snacks_indent ~= false
              and vim.b[buf].snacks_indent ~= false
              and vim.bo[buf].buftype == ""
              and not vim.tbl_contains(excluded_filetypes, ft)
        end,
      },
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
