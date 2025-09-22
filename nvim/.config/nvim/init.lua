-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("color catppuccin")
vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight NormalNC guibg=NONE")
vim.cmd("highlight NonText guibg=NONE")
vim.cmd("highlight NeoTreeNormal guibg=NONE")
vim.cmd("highlight NeoTreeNormalNC guibg=NONE")
vim.cmd("highlight SignColumn guibg=NONE")

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", blend = 30 })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none", blend = 20 })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none", blend = 30 })

vim.api.nvim_set_hl(0, "NoiceScrollbar", { bg = "none", fg = "#999999", blend = 0 })
vim.api.nvim_set_hl(0, "NoiceScrollbarThumb", { bg = "none", fg = "#999999", blend = 0 })

vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })

vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#F9E6B7" })
vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#F9E6B7" })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#5C845F" })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "SnacksDashboardFile", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#A6E3A1" })
vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { link = "Number" })

-- replace "lambda" with "λ" in racket files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "racket",
  callback = function()
    vim.cmd("iabbrev <buffer> lambda λ")
  end,
})
