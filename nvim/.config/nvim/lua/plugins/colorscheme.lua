return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      -- float = {
      --   transparent = true,
      --   solid = true,
      -- },
      integrations = {
        neotree = true,
        snacks = true,
        dashboard = true,
        drop = true,
      },

      custom_highlights = {
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        NonText = { bg = "NONE" },
        SignColumn = { bg = "NONE" },

        -- Drop = { bg = "NONE", nocombine = false, blend = 100 },

        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },

        NormalFloat = { bg = "NONE", blend = 30 },
        FloatBorder = { link = "Normal" },
        FloatTitle = { bg = "NONE", blend = 30 },
        Pmenu = { bg = "NONE", blend = 20 },

        NoiceScrollbar = { fg = "#999999", bg = "NONE" },
        NoiceScrollbarThumb = { fg = "#999999", bg = "NONE" },

        StatusLine = { bg = "NONE" },

        SnacksDashboardHeader = { fg = "#F9E6B7" },
        SnacksDashboardTitle = { fg = "#F9E6B7" },
        SnacksDashboardIcon = { fg = "#5C845F" },
        SnacksDashboardDesc = { fg = "#A6E3A1" },
        SnacksDashboardFile = { fg = "#A6E3A1" },
        SnacksDashboardFooter = { fg = "#A6E3A1" },
        SnacksDashboardSpecial = { link = "Number" },
      },
    },
  },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "moon" },
  --   transparent = true,
  --   styles = {
  --     sidebars = "transparent",
  --     floats = "transparent",
  --   },
  -- },
  -- {
  --   "chaserensberger/christmas.nvim",
  --   name = "christmas",
  --   lazy = false,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
