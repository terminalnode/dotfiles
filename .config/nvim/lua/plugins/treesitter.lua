return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          -- C / C++
          "c", "cpp",

          -- Go
          "go", "gomod", "gosum", "gotmpl",

          -- Web
          "css", "html", "javascript", "typescript",
          "dockerfile", "terraform",

          -- JVM (ish)
          "clojure", "java", "kotlin",

          -- Shell / vim / config / git
          "awk", "diff", "bash", "regex",
          "lua", "vim", "vimdoc",
          "ssh_config", "sway", "desktop",
          "gitignore", "git_config", "gitcommit",

          -- Other
          "c_sharp", -- no it's not C/C++ :-)
          "haskell",
          "python",
          "query",
          "rust",
        },
        auto_install = true,
        highlight = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<Leader>si",
            node_incremental  = "<Leader>si", -- Selection Init/Increment
            node_decremental  = "<Leader>sd", -- Selection Decrement
            scope_incremental = "<Leader>sc", -- Selection SCope
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj
            keymaps = {
              ["af"] = { query = "@function.outer" },
              ["if"] = { query = "@function.inner" },
              ["ac"] = { query = "@class.outer" },
              ["ic"] = { query = "@class.inner" },
            },
            selection_modes = {
              ["@parameter.outer"] = "v",     -- charwise
              ["@function.outer"]  = "V",     -- linewise
              ["@class.outer"]     = "<c-v>", -- blockwise
            }
          }
        },
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" }
}
