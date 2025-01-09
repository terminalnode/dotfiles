return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        terraform = { "terraform_fmt" },

        -- Various flavours of JavaScript
        -- ts_ls formatting is disabled, so in practice this will use the eslint LSP for formatting
        javascript = {},
        javascriptreact = {},
        typescript = {},
        typescriptreact = {},
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
      },
      notify_no_formatters = true,
      notify_on_error = true,
    },
  }
}
