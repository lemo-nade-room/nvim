require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",
  "html",
  "cssls",
  "ts_ls",
  "svelte",
  "bashls",
  "yamlls",
  "jsonls",
  "taplo",
  "pkl_ls",
  "terraformls",
  "tflint",
  "gh_actions_ls",
  "sourcekit",
}

vim.lsp.config("pkl_ls", {
  cmd = { "pkl-lsp" },
  filetypes = { "pkl" },
  root_markers = { "PklProject", ".git" },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
