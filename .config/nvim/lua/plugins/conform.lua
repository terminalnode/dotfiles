return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        terraform = { "terraform_fmt" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
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
