return {
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {
      open_cmd = "qutebrowser %s",
    },
    keys = {
      {
        "<leader>yt",
        ":TypstPreviewToggle<CR>",
        desc = "TypstPreviewToggle",
        { "n", "v" },
      },
    },
  },
  -- {
  --   "al-kot/typst-preview.nvim",
  --   opts = {
  --     preview = {
  --       position = "left",
  --     },
  --   },
  -- },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = true,
  },
}
