return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        shell = "/bin/zsh",
        shell_args = { "-l" },
        direction = "horizontal",
        size = 15,
        open_mapping = [[<Leader>tt]],
      })
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n><C-w>p]], { noremap = true, silent = true })
    end,
  },
}
