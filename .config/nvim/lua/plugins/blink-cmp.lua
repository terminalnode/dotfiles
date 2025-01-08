return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        -- All presets use C-space for this, which is great if and only
        -- if you don't have that bound to toggle chinese input already.
        ["<C-g>"] = { "show", "show_documentation", "hide_documentation" },
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
  }
}
