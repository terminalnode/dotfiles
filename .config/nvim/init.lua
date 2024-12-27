-- Basic config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.scrolloff = 13            -- Make view follow cursor to a reasonable degree
vim.opt.clipboard = "unnamedplus" -- Synchronize vim clipboard with system clipboard
vim.opt.inccommand = "split"      -- Preview changes such as find and replace in a split window
vim.opt.virtualedit = "block"     -- Enable virtualedit in block mode

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Keybinds
vim.g.mapleader = " "

-- Lazy.nvim configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  checker = { enabled = true },
  defaults = { lazy = false },
  install = { colorscheme = { "catppuccin-latte", "delek" } },
  spec = {
    { import = "plugins" },
    { "terminalnode/vim-zenkaku", event = "VeryLazy" },
    { "nvim-tree/nvim-web-devicons" }, -- Fancy icons
    { "MunifTanjim/nui.nvim" },        -- UI components library
    { "nvim-lua/plenary.nvim" },       -- lua functions library

    {
      "folke/snacks.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        terminal = {},
      },
    },

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

    {
      "folke/noice.nvim",
      events = "VeryLazy",
      dependencies = { "nui.nvim" },
      opts = {  lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
      },
    },
  },

  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function() vim.cmd.colorscheme("catppuccin-latte") end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup({}) end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local c = require("lspconfig")
      c.clangd.setup({ silent = true })
      c.lua_ls.setup({
        silent = true,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      c.nixd.setup({ silent = true })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "plenary.nvim", "nui.nvim", "nvim-web-devicons" },
  },

  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "plenary.nvim" },
  },
},
})
