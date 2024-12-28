return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local c = require("lspconfig")
      c.lua_ls.setup({
        -- For Lua it's mostly gonna be neovim files, where it's fine not to have the LSP
        silent = true,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            }
          },
        },
      })

      -- For these languages I kinda want it to warn if server not installed (silent = false)
      c.clangd.setup({ silent = false })
      c.hls.setup({ silent = false, filetypes = { "haskell", "lhaskell", "cabal" } })
      c.nixd.setup({ silent = false })
      c.rust_analyzer.setup({ silent = false })
    end,
  },
}
