-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")

-- :W == :w
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Q", "quit", {})

-- clear highlighting
-- vim.keymap.set({ "n" }, "<C-l>", "<cmd>noh<CR>")

-- append next line without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- paste over highligh without loosing the text in buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- start replacing the word you are on in the whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make the file executable
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })

-- jumping to the end backwards
vim.keymap.set("n", "<C-e>", "ge")

-- scrolling down without moving the cursor
vim.keymap.set("n", "<C-m>", "<C-e>")

-- jumping half page keeps the cursor at the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- LSP renaming
vim.keymap.set("n", "<leader>r", ":IncRename ")

-- copy line diagnostics to the systems clipboard
vim.keymap.set(
  "n",
  "<leader>cy",
  ":lua vim.diagnostic.open_float()<CR>:lua vim.diagnostic.open_float()<CR>:%y+<CR>:q<CR>",
  { desc = 'Copy Line Diagnostics to "+' }
)

-- copy filename to the systems clipboard
vim.keymap.set("n", "<leader>fC", ":let @+ = expand('%:p')<CR>", { desc = 'Copy filepath to "+' })
