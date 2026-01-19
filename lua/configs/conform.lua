local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    swift = { "swift_format" },
  },

  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}