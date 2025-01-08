local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = function()
      local harpoon = require("harpoon")
      return {
        -- Basics
        { "<leader>ha", function() harpoon:list():add() end,                         desc = "Harpoon add" },
        { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon menu" },
        { "<leader>ht", function() toggle_telescope(harpoon:list()) end,             desc = "Harpoon telescope" },

        -- Direct navigation
        { "<leader>h1", function() harpoon:list():select(1) end,                     desc = "Harpoon file 1" },
        { "<leader>h2", function() harpoon:list():select(2) end,                     desc = "Harpoon file 2" },
        { "<leader>h3", function() harpoon:list():select(3) end,                     desc = "Harpoon file 3" },
        { "<leader>h4", function() harpoon:list():select(4) end,                     desc = "Harpoon file 4" },
        { "<leader>h4", function() harpoon:list():select(5) end,                     desc = "Harpoon file 5" },
        { "<leader>h4", function() harpoon:list():select(6) end,                     desc = "Harpoon file 6" },
        { "<leader>hn", function() harpoon:list():next({ ui_nav_wrap = true }) end,  desc = "Harpoon next" },
        { "<leader>hp", function() harpoon:list():prev({ ui_nav_wrap = true }) end,  desc = "Harpoon prev" },
      }
    end,
    config = function()
      require("harpoon").setup()
    end,
  }
}
