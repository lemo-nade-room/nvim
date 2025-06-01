return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                enable_bracket_in_quote = true,
                enable_afterquote = true,
                map_cr = true,
                map_bs = true,
            })
        end,
    },
}
