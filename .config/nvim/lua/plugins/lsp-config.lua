local function lsp_keymap(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "super-tab",
        -- All presets use C-space for this, which is great if and only
        -- if you don't have that bound to toggle chinese input already.
        ["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
      },

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
    dependencies = {
      "blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    opts = {
      servers = {
        lua_ls = {       -- lua-language-server
          silent = true, -- Usually neovim files, fine not to have the LSP
        },

        css_variables = { -- css-variables-language-server
          silent = true,
        },

        tailwindcss = { -- tailwindcss-language-server
          silent = true,
        },

        eslint = { -- vscode-langservers-extracted
          silent = true,
        },

        clangd = { -- Included with clang package on arch
          silent = false,
        },

        hls = { -- haskell-language-server
          silent = false,
          filetypes = { "haskell", "lhaskell", "cabal" },
        },

        nixd = {
          silent = false,
        },

        prismals = { -- prisma-language-server
          silent = false
        },

        rust_analyzer = {
          silent = false
        },

        ts_ls = { -- typescript-language-server
          silent = false
        },
      },
    },
    config = function(_, opts)
      local blink = require("blink.cmp")
      local c = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = blink.get_lsp_capabilities(config.capabilities)
        config.on_attach = function(client, bufnr)
          lsp_keymap(bufnr)
        end
        c[server].setup(config)
      end

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() vim.lsp.buf.format() end,
      })
    end,
  },
}