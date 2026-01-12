return {
  "folke/which-key.nvim",
  opts = {
    win = {
      height = { min = 4, max = 50 },
    },
    spec = {
      {
        mode = { "n", "x" },
        { "<leader>uh", group = "InlayHints", icon = { icon = "󱙝" } },
        { "<leader>m", group = "mini", icon = { icon = "" } },
        { "<leader>ms", group = "surround", icon = { icon = "󰗅" } },
        { "<leader>y", group = "Typst", icon = { icon = "" } },
        { "<leader>r", icon = { icon = "󰑕" } },
        { "<leader>o", icon = { icon = "" } },
        { "<leader>O", icon = { icon = "" } },
        { "<leader>i", icon = { icon = "" } },
        { "<leader>I", icon = { icon = "" } },
        { "<leader>X", icon = { icon = "" } },
        { "<leader>K", icon = { icon = "󱔘" } },
        { "<leader>Y", icon = { icon = "" } },
      },
    },
  },
}
