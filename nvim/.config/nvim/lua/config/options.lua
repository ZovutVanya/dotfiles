-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- colorscheme and transparency

-- vim.g.spellfile_URL = "http://ftp.vim.org/pub/vim/"

-- vim.filetype.add({
--   extension = {
--     zsh = "zsh",
--   },
-- })

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.winborder = "rounded"

vim.opt.clipboard = ""

vim.opt.cmdheight = 1

vim.diagnostic.config({
  -- virtual_text = false,
  virtual_lines = {
    current_line = true,
  },
})

-- vim.opt.colorcolumn = "80"

-- allows the block cursor to be placed one character after line's end
vim.opt.virtualedit:append({ "onemore" })

vim.opt.scrolloff = 4

vim.opt.textwidth = 140

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

if package.config:sub(1, 1) == "\\" then
  vim.cmd("set shell=pwsh")
  vim.cmd("set shellcmdflag=-command")
  vim.cmd('set shellquote="')
  vim.cmd("set shellxquote=")
end
