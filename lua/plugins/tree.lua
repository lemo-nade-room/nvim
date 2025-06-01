return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                view = { width = 40, side = "left" },
            })
            vim.keymap.set(
                    "n",
                    "<Leader>e",
                    ":NvimTreeToggle<CR>:NvimTreeFocus<CR>",
                    { noremap = true, silent = true }
            )
            vim.cmd([[
                autocmd VimEnter * NvimTreeOpen
                autocmd VimEnter * wincmd p
            ]])
        end,
    },
}
