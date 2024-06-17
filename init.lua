local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "Shougo/neosnippet.vim",
  "Shougo/neosnippet-snippets",
  "neoclide/coc.nvim",
  "lambdalisue/fern.vim",
  "tpope/vim-commentary",
  "ctrlpvim/ctrlp.vim",
  "simeji/winresizer",
  "lewis6991/gitsigns.nvim",
  "norcalli/nvim-colorizer.lua",
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  "echasnovski/mini.indentscope",
  "github/copilot.vim",
})

-- バックアップとスワップファイルを無効
vim.opt.backup = false
vim.opt.swapfile = false

-- init.luaを保存したら自動で読み込み
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.stdpath("config") .. "/init.lua",
  command = "source %",
})

-- インデント可視化
vim.opt.list = true
vim.opt.listchars = { tab = '»-', trail = '-', eol = '↲', extends = '»', precedes = '«', nbsp = '%' }

-- エンコーディング
vim.opt.encoding = "utf-8"

-- jキー二度押しでESC
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', 'っj', '<Esc>', {silent = true, noremap = true})

-- ヘルプを日本語化
vim.opt.helplang = "ja"

-- 行番号表示
vim.opt.number = true

-- タブ設定
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = false

-- バックスペースの設定
vim.opt.backspace = { "indent", "eol", "start" }

-- 棒状カーソル設定
vim.g.t_SI = "\\<Esc>]50;CursorShape=1\\x7"
vim.g.t_EI = "\\<Esc>]50;CursorShape=0\\x7"
vim.api.nvim_set_keymap('i', '<Esc>', '<Esc>lh', {silent = true, noremap = true})

-- 互換性のない設定を無効
vim.opt.compatible = false

-- ファイルタイプに基づくインデントとプラグイン
vim.cmd [[
  if has('filetype')
    filetype indent plugin on
  endif
]]

-- シンタックスハイライトを有効
vim.cmd [[
  if has('syntax')
    syntax on
  endif
]]

-- カラースキーム設定
vim.cmd "colorscheme tokyonight-night"

