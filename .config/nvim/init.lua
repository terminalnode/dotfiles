-- Basic config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:2"

vim.opt.scrolloff = 13            -- Make view follow cursor to a reasonable degree
vim.opt.clipboard = "unnamedplus" -- Synchronize vim clipboard with system clipboard
vim.opt.inccommand = "split"      -- Preview changes such as find and replace in a split window
vim.opt.virtualedit = "block"     -- Enable virtualedit in block mode
vim.opt.statusline = "3"          -- One statusline for all windows

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<C-p>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right window" })

-- Lazy.nvim configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
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

  -- Color schemes have priority, if Catppuccin is not yet installed,
  -- delek is probably the most acceptable looking built-in light theme.
  install = { colorscheme = { "catppuccin-latte", "delek" } },

  spec = {
    { import = "plugins" },
    {
      "terminalnode/vim-zenkaku",
      event = "VeryLazy",
    },

    -- Commonly used dependencies so we can use the short name when adding them
    -- to plugins. e.g. { "nui.nvim" } instead of { "MunifTanjim/nui.nvim" }
    { "nvim-tree/nvim-web-devicons" }, -- Fancy icons
    { "echasnovski/mini.icons" },      -- More fancy icons
    { "MunifTanjim/nui.nvim" },        -- UI components library
    { "nvim-lua/plenary.nvim" },       -- Lua functions library
    { "nvim-telescope/telescope-fzf-native.nvim" },
    { "BurntSushi/ripgrep" },
  },
})
