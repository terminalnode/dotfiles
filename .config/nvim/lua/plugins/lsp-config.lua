return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },

      appearance = {
        -- Fallback for when your theme doesn't support blink.cmp
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = "mono"
      },

      -- Show signature help when passing parameters to a function
      -- https://cmp.saghen.dev/configuration/signature.html
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "blink.cmp" },
    opts = {
      servers = {
        lua_ls = {
          -- For Lua it's usually gonna be neovim files, where it's fine not to have the LSP
          silent = true,

          settings = {
            Lua = {
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              }
            },
          },
        },

        clangd = { silent = false },
        hls = { silent = false, filetypes = { "haskell", "lhaskell", "cabal" } },
        nixd = { silent = false },
        rust_analyzer = { silent = false },
      },
    },
    config = function(_, opts)
      local blink = require("blink.cmp")
      local c = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = blink.get_lsp_capabilities(config.capabilities)
        c[server].setup(config)
      end
    end,
  },
}
