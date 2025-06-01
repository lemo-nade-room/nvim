local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local function on_attach(client, bufnr)
    local wk = vim.keymap
    wk.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, silent = true })
    wk.set("n", "K",  vim.lsp.buf.hover,      { buffer = bufnr, silent = true })
    wk.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, silent = true })
    wk.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr, silent = true })
end


local function setup_swift_lsp()
    local lspconfig = require("lspconfig")
    lspconfig.sourcekit.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = function(fname)
            return lspconfig.util.root_pattern("Package.swift", ".git")(fname)
                    or vim.loop.os_homedir()
        end,
    }
end

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            setup_swift_lsp()
        end,
    },
}
